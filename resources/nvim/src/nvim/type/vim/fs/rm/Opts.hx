package nvim.type.vim.fs.rm;

/**
	```lua
	(class) vim.fs.rm.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.fs.rm.Opts.force: boolean?
		```
		
		---
		
		
		 Ignore nonexistent files and arguments
	**/
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.fs.rm.Opts.recursive: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Remove directories and their contents recursively
	**/
	var recursive : Null<Bool>;
}