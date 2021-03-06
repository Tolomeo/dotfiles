local Module = require("_shared.module")
local key = require("_shared.key")
local fn = require("_shared.fn")
local arr = require("_shared.array")
local settings = require("settings")

local Git = Module:extend({
	plugins = {
		{ "lewis6991/gitsigns.nvim" },
	},
})

function Git:setup()
	local preview_config = require("interface.window"):float_config()

	require("gitsigns").setup({
		signs = {
			add = { text = "├" },
			change = { text = "├" },
			delete = { text = "┤" },
			topdelete = { text = "┤" },
			changedelete = { text = "┼" },
			untracked = { text = "│" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 100,
		},
		preview_config = preview_config,
		on_attach = function(buffer)
			local keymap = settings.keymap
			local actions = self:actions()
			local mappings = arr.map(actions, function(action)
				return { action.keymap, action.handler, buffer = buffer }
			end)

			key.nmap(unpack(mappings))
			key.nmap({
				keymap["git.menu"],
				fn.bind(self.actions_context_menu, self),
			})
		end,
	})
end

function Git:actions()
	local keymap = settings.keymap

	return {
		{
			name = "Show change",
			keymap = keymap["git.hunk.preview"],
			handler = fn.bind(self.preview_hunk, self),
		},
		{
			name = "Select change",
			keymap = keymap["git.hunk.select"],
			handler = fn.bind(self.select_hunk, self),
		},
		{
			name = "Go to next change",
			keymap = keymap["git.hunk.next"],
			handler = fn.bind(self.next_hunk, self),
		},
		{
			name = "Go to prev change",
			keymap = keymap["git.hunk.prev"],
			handler = fn.bind(self.prev_hunk, self),
		},
		{
			name = "Blame line",
			keymap = keymap["git.blame"],
			handler = fn.bind(self.blame, self),
		},
		{
			name = "Show changes",
			keymap = keymap["git.diff"],
			handler = fn.bind(self.diff, self),
		},
	}
end

function Git:actions_context_menu()
	local actions = self:actions()
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
		prompt_title = "Git changes",
	}

	require("integration.finder"):create_context_menu(menu, options)
end

function Git:blame()
	return require("gitsigns").blame_line()
end

function Git:diff()
	return require("gitsigns").diffthis()
end

--[[ function Git:has_diff()
	return vim.api.nvim_win_get_option(0, "diff")
end ]]

function Git:preview_hunk()
	return require("gitsigns").preview_hunk()
end

function Git.select_hunk()
	return require("gitsigns").select_hunk()
end

function Git:next_hunk()
	require("gitsigns.actions").next_hunk({ preview = true })
end

function Git:prev_hunk()
	require("gitsigns.actions").prev_hunk({ preview = true })
end

return Git:new()
