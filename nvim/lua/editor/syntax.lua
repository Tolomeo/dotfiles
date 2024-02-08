local Module = require("_shared.module")
local fs = require("_shared.fs")
local arr = require("_shared.array")
local tbl = require("_shared.table")
local str = require("_shared.str")
local map = require("_shared.map")
local settings = require("settings")

local Syntax = Module:extend({
	plugins = {
		-- Highlight, edit, and code navigation parsing library
		{ "nvim-treesitter/nvim-treesitter" },
		-- Syntax aware text-objects based on treesitter
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		-- Setting commentstrings based on treesitter
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		-- Auto closing tags
		{
			"windwp/nvim-ts-autotag",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		-- Code annotations
		{ "danymat/neogen", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	},
})

function Syntax:setup()
	local config = settings.config

	local syntaxes = tbl.reduce(map.keys(config.language), function(_syntaxes, filetypes)
		local ts_parsers = require("nvim-treesitter.parsers")

		arr.push(
			_syntaxes,
			unpack(arr.filter(
				arr.map(str.split(filetypes, ","), function(filetype)
					return ts_parsers.ft_to_lang(str.trim(filetype))
				end),
				function(parser)
					return ts_parsers.list[parser] ~= nil
				end
			))
		)

		return _syntaxes
	end, {})

	require("nvim-treesitter.configs").setup({
		ensure_installed = syntaxes,
		sync_install = true,
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	})

	-- Autotag
	require("nvim-ts-autotag").setup()

	-- commentstrings
	require("ts_context_commentstring").setup({})

	require("neogen").setup({})

	local language_configs = config.language

	for language_filetypes, language_config in map.pairs(language_configs) do
		local filetypes_parsers = language_config.parser

		if not filetypes_parsers then
			goto continue
		end

		arr.each(str.split(language_filetypes, ","), function(language_filetype)
			local filetype_parser = filetypes_parsers[language_filetype]

			if not filetype_parser then
				return
			end

			local filetype_queries_dir = string.format("%s/queries/%s", vim.fn.stdpath("config"), language_filetype)

			-- TODO: error handling
			os.execute(string.format("mkdir -p %s", filetype_queries_dir))

			local parser_queries_dirs, parser_install_info = map.destructure(filetype_parser, "queries")

			for _, parser_queries_dir in ipairs(parser_queries_dirs) do
				-- TODO: error handling
				os.execute(
					string.format(
						"cp -n %s %s",
						string.format("%s/%s", parser_install_info.url, parser_queries_dir),
						filetype_queries_dir
					)
				)
			end

			local ts_parsers = require("nvim-treesitter.parsers").get_parser_configs()
			ts_parsers[language_filetype] = {
				install_info = parser_install_info,
				filetype = language_filetype,
			}
		end)

		::continue::
	end
end

return Syntax:new()
