package nvim.type.vim.fs.normalize;

/**
	```lua
	(class) vim.fs.normalize.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.fs.normalize.Opts.expand_env: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Expand environment variables.
		 (default: `true`)
	**/
	@:optional
	extern var expand_env : Null<Bool>;
	/**
		```lua
		(field) vim.fs.normalize.Opts.win: boolean?
		```
		
		---
		
		
		 Path is a Windows path.
		 (default: `true` in Windows, `false` otherwise)
	**/
	@:optional
	extern var win : Null<Bool>;
}