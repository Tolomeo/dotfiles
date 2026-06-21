package nvim.type.vim.fs.rm;

/**
	```lua
	(class) vim.fs.rm.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.fs.rm.Opts.force: boolean?
		```
		
		---
		
		
		 Ignore nonexistent files and arguments
	**/
	@:optional
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.fs.rm.Opts.recursive: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Remove directories and their contents recursively
	**/
	@:optional
	extern var recursive : Null<Bool>;
}