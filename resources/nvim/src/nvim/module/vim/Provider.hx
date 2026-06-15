package nvim.module.vim;

extern class Provider {
	/**
		```lua
		(global) vim.provider.perl: table
		```
	**/
	var perl : nvim.module.vim.provider.Perl;
	/**
		```lua
		(global) vim.provider.python: table
		```
	**/
	var python : nvim.module.vim.provider.Python;
	/**
		```lua
		(global) vim.provider.ruby: table
		```
	**/
	var ruby : nvim.module.vim.provider.Ruby;
}