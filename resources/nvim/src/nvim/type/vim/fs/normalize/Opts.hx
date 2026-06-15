package nvim.type.vim.fs.normalize;

/**
	```lua
	(class) vim.fs.normalize.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.fs.normalize.Opts.expand_env: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Expand environment variables.
		 (default: `true`)
	**/
	var expand_env : Null<Bool>;
	/**
		```lua
		(field) vim.fs.normalize.Opts.win: boolean?
		```
		
		---
		
		
		 Path is a Windows path.
		 (default: `true` in Windows, `false` otherwise)
	**/
	var win : Null<Bool>;
}