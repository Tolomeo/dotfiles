local function find_hxml(path)
	return vim.fs.find(function(name)
		return name:match(".hxml$")
	end, { path = path, type = "file" })
end

-- @type vim.lsp.Config
return {
	cmd = { "haxe-language-server" },
	filetypes = { "haxe" },
	root_markers = { "build.hxml", ".haxelib", ".git" },
	settings = {
		haxe = {
			executable = "haxe",
		},
	},
	-- Default value is set by on_new_config.
	init_options = {},
	-- Searching for the hxml to initialise the lsp with
	-- will use the user specified one, if set in init_options
	-- otherwise will take the first hxml file found in the root dir
	before_init = function(params, config)
		if params.initializationOptions.displayArguments then
			vim.notify("Using user defined HXML: " .. params.initializationOptions.displayArguments)
			return
		end

		local hxml = find_hxml(config.root_dir)[1]

		if not hxml then
			vim.notify("No HXML file found")
			return
		end

		vim.notify("Using HXML: " .. hxml)
		params.initializationOptions.displayArguments = hxml
	end,
}
