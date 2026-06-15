package nvim.type.vim.lsp.util.rename;

/**
	```lua
	(class) vim.lsp.util.rename.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.ignoreIfExists: boolean?
		```
	**/
	var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.overwrite: boolean?
		```
		
		---
		
		 @inlinedoc
	**/
	var overwrite : Null<Bool>;
}