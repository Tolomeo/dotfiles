local Module = require("_shared.module")
local au = require("_shared.au")
local arr = require("_shared.array")
local map = require("_shared.map")
local fn = require("_shared.fn")
local validator = require("_shared.validator")
local key = require("_shared.key")
local settings = require("settings")

local Location = Module:extend({
	plugins = {
		{ "stevearc/qf_helper.nvim" },
		{ "https://gitlab.com/yorickpeterse/nvim-pqf.git" },
	},
})

function Location:setup()
	self:_setup_keymaps()
	self:_setup_plugins()
end

Location.actions = validator.f.arguments({
	validator.f.instance_of(Location),
	validator.f.optional(validator.f.one_of({ "n", "v", "V" })),
}) .. function(self, mode)
	local keymap = settings.keymap
	local open = require("qf_helper").open_split
	local navigate = require("qf_helper").navigate

	local actions = {
		n = {
			{
				name = "Open item in new tab",
				keymap = keymap["list.item.open.tab"],
				handler = fn.bind(key.input, "<C-W><CR><C-W>T"),
			},
			{
				name = "Open item in vertical split",
				keymap = keymap["list.item.open.vertical"],
				handler = fn.bind(open, "vsplit"),
			},
			{
				name = "Open entry in horizontal split",
				keymap = keymap["list.item.open.horizontal"],
				handler = fn.bind(open, "split"),
			},
			{
				name = "Open item preview",
				keymap = keymap["list.item.open.preview"],
				handler = fn.bind(key.input, "<CR><C-W>p"),
			},
			{
				name = "Open previous item preview",
				keymap = keymap["list.item.prev.open.preview"],
				handler = fn.bind(key.input, "k<CR><C-W>p"),
			},
			{
				name = "Open next item preview",
				keymap = keymap["list.item.next.open.preview"],
				handler = fn.bind(key.input, "j<CR><C-W>p"),
			},
			-- NOTE: Navigate methods don't work properly
			-- TODO: Debug
			{
				name = "Navigate to first entry",
				keymap = keymap["list.navigate.first"],
				handler = fn.bind(navigate, -1, { by_file = true }),
			},
			{
				name = "Navigate to last entry",
				keymap = keymap["list.navigate.last"],
				handler = fn.bind(navigate, 1, { by_file = true }),
			},
			{
				name = "Remove item",
				keymap = keymap["list.item.remove"],
				handler = fn.bind(vim.fn.execute, "Reject"),
			},
			{
				name = "Keep item",
				keymap = keymap["list.item.keep"],
				handler = fn.bind(vim.fn.execute, "Keep"),
			},
			{
				name = "Search items",
				keymap = keymap["list.search"],
				handler = function()
					local is_loclist = self:is_loclist()

					if is_loclist then
						return require("integration.finder"):find("loclist_items")
					end

					require("integration.finder"):find("quickfix_items")
				end,
			},
			{
				name = "Load older list",
				keymap = keymap["window.cursor.left"],
				handler = function()
					local is_loclist = self:is_loclist()

					if is_loclist then
						return vim.fn.execute("lolder")
					end

					vim.fn.execute("colder")
				end,
			},
			{
				name = "Load newer list",
				keymap = keymap["window.cursor.right"],
				handler = function()
					local is_loclist = self:is_loclist()

					if is_loclist then
						return vim.fn.execute("lnewer")
					end

					vim.fn.execute("cnewer")
				end,
			},
		},
		-- NOTE: These actions don't work properly when triggered through the menu
		-- TODO: investigate why
		v = {
			{
				name = "Remove items selection",
				keymap = keymap["list.item.remove"],
				handler = fn.bind(key.input, ":Reject<Cr>"),
			},
			{
				name = "Keep items selection",
				keymap = keymap["list.item.keep"],
				handler = fn.bind(key.input, ":Keep<Cr>"),
			},
		},
	}

	if mode then
		-- NOTE: the mode returned by vim.api.nvim_get_mode() contains more values than those allowed for setting keymaps
		-- see :h nvim_set_keymap and :h mode()
		-- so we lowercase to transform visual line (V) into visual (v) which will work for any visual mode
		return actions[string.lower(mode)]
	end

	return actions
end

function Location:_setup_keymaps()
	local keymap = settings.keymap

	key.nmap(
		{ keymap["list.open"], fn.bind(self.open, self) },
		{ keymap["list.close"], fn.bind(self.close, self) },
		{ keymap["list.next"], fn.bind(self.next, self) },
		{ keymap["list.prev"], fn.bind(self.prev, self) }
	)

	au.group({
		"OnQFFileType",
	}, {
		"FileType",
		"qf",
		function(autocmd)
			local buffer = autocmd.buf
			local actions = self:actions()

			for mode, mode_actions in map.pairs(actions) do
				local mode_keymaps = arr.map(mode_actions, function(mode_action)
					return { mode_action.keymap, mode_action.handler, buffer = buffer }
				end)

				table.insert(mode_keymaps, {
					keymap["dropdown.open"],
					function()
						self:actions_menu()
					end,
					buffer = buffer,
				})

				key.map(mode, unpack(mode_keymaps))
			end
		end,
	})
end

function Location:_setup_plugins()
	require("pqf").setup()
	require("qf_helper").setup({
		prefer_loclist = true,
		quickfix = {
			default_bindings = false,
		},
		loclist = {
			default_bindings = false,
		},
	})
end

---@type fun(self: List, window: number | nil): boolean
Location.is_loclist = validator.f.arguments({ validator.f.instance_of(Location), validator.f.optional("number") })
	.. function(_, window)
		window = window or vim.api.nvim_get_current_win()
		local window_info = vim.fn.getwininfo(window)[1]

		return window_info.quickfix == 1 and window_info.loclist == 1
	end

---@type fun(self: List, window: number | nil): boolean
Location.is_loclist_open = validator.f.arguments({ validator.f.instance_of(Location), validator.f.optional("number") })
	.. function(_, window)
		window = window or 0

		return vim.fn.getloclist(window, { winid = 0 }).winid ~= 0
	end

---@type fun(self: List, window: number | nil): table
Location.get_loclist = validator.f.arguments({ validator.f.instance_of(Location), validator.f.optional("number") })
	.. function(_, window)
		window = window or 0

		return vim.fn.getloclist(window)
	end

---@param window number | nil
---@return boolean
function Location:has_loclist_items(window)
	local loclist = self:get_loclist(window)
	return #loclist > 1
end

---@type fun(self: List, window: number | nil): table
Location.clear_loclist = validator.f.arguments({ validator.f.instance_of(Location), validator.f.optional("number") })
	.. function(_, window)
		window = window or 0

		vim.fn.setloclist(window, {})
	end

---@type fun(self: List, window: number | nil): table
Location.is_qflist = validator.f.arguments({ validator.f.instance_of(Location), validator.f.optional("number") })
	.. function(_, window)
		window = window or vim.api.nvim_get_current_win()
		local window_info = vim.fn.getwininfo(window)[1]

		return window_info.quickfix == 1 and window_info.loclist == 0
	end

function Location:is_qflist_open()
	return vim.fn.getqflist({ winid = 0 }).winid ~= 0
end

function Location:get_qflist()
	return vim.fn.getqflist()
end

function Location:has_qflist_items()
	local qflist = self:get_qflist()

	return #qflist > 1
end

function Location:clear_qflist()
	vim.fn.setqflist({})
end

--NOTE: since we check whether the lists contains any elements
--it becomes impossible to open a list with this method with the purpose of reaching for an older list
--TODO: create a new method catering for the use case
function Location:open()
	local qf_helper = require("qf_helper")

	if self:has_loclist_items() then
		return qf_helper.open("l", { enter = true })
	elseif self:has_qflist_items() then
		return qf_helper.open("c", { enter = true })
	end
end

function Location:close()
	local qf_helper = require("qf_helper")

	if self:is_loclist_open() then
		qf_helper.close("l")
		self:clear_loclist()
		return
	elseif self:is_qflist_open() then
		qf_helper.close("c")
		self:clear_qflist()
		return
	end
end

function Location:next()
	vim.fn.execute("QNext")
end

function Location:prev()
	vim.fn.execute("QPrev")
end

function Location:actions_menu()
	local mode = vim.api.nvim_get_mode().mode
	local actions = self:actions(mode)

	if not actions then
		return
	end

	local is_loclist = self:is_loclist()
	local menu = vim.tbl_extend(
		"error",
		arr.map(actions, function(action)
			return { action.name, action.keymap, handler = action.handler }
		end),
		{
			on_select = function(modal_menu)
				local selection = modal_menu.state.get_selected_entry()
				modal_menu.actions.close(modal_menu.buffer)
				selection.value.handler()
			end,
		}
	)
	local options = {
		prompt_title = is_loclist and "Location list" or "Quickfix list",
	}

	require("integration.finder"):create_context_menu(menu, options)
end

return Location:new()
