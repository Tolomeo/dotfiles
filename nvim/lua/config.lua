local Module = require("_shared.module")
local tbl = require("_shared.table")
local map = require("_shared.map")
local fs = require("_shared.fs")
local key = require("_shared.key")
local settings = require("settings")

local plugins_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local packages_install_path = vim.fn.stdpath("data") .. "/mason"

local Config = Module:extend({
	plugins = {
		{ "folke/lazy.nvim", lazy = false },
		{ "williamboman/mason.nvim" },
	},
	modules = {
		"interface",
		"editor",
		"project",
		"integration",
	},
})

function Config:setup()
	settings:init()
	-- setting leader key
	key.map_leader(settings.keymap.leader)

	self:setup_plugins()
	self:setup_packages()
end

function Config:setup_plugins()
	-- Cloning plugin manager in place if it is not found
	if not fs.existsSync(plugins_install_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			plugins_install_path,
		})
	end

	vim.opt.runtimepath:prepend(plugins_install_path)

	require("lazy").setup(self:list_plugins())
end

function Config:setup_packages()
	local languages = settings.config.language

	require("mason").setup({
		install_root_dir = packages_install_path,
	})

	local install_formatters = tbl.reduce(languages, function(_install_formatters, language_config)
		if language_config.format == nil then
			return _install_formatters
		end

		for _, formatter_name in ipairs(language_config.format) do
			if _install_formatters[formatter_name] ~= nil then
				goto continue
			end

			local lsp = require("mason-lspconfig.mappings.server").lspconfig_to_package[formatter_name]

			if lsp then
				goto continue
			end

			local is_installed_locally = vim.fn.executable(
				string.format("%s/bin/%s", packages_install_path, formatter_name)
			) == 1
			local is_installed_globally = vim.fn.executable(formatter_name) == 1

			if not is_installed_locally and not is_installed_globally then
				_install_formatters[formatter_name] = true
			end

			::continue::
		end

		return _install_formatters
	end, {})

	-- IDEA: should we delay until the filetype is opened?
	if next(install_formatters) then
		vim.fn.execute(string.format("MasonInstall %s", table.concat(map.keys(install_formatters), " ")))
	end
end

return Config:new()
