package nvim.type.vim.loader.find;

/**
	```lua
	(class) vim.loader.find.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.loader.find.Opts.all: boolean?
		```
		
		---
		
		
		 Search for all matches.
		 (default: `false`)
	**/
	@:optional
	extern var all : Null<Bool>;
	/**
		```lua
		(field) vim.loader.find.Opts.paths: string[]?
		```
		
		---
		
		
		 Extra paths to search for modname
		 (default: `{}`)
	**/
	@:optional
	extern var paths : Null<Array<String>>;
	/**
		```lua
		(field) vim.loader.find.Opts.patterns: string[]?
		```
		
		---
		
		
		 List of patterns to use when searching for modules.
		 A pattern is a string added to the basename of the Lua module being searched.
		 (default: `{"/init.lua", ".lua"}`)
	**/
	@:optional
	extern var patterns : Null<Array<String>>;
	/**
		```lua
		(field) vim.loader.find.Opts.rtp: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Search for modname in the runtime path.
		 (default: `true`)
	**/
	@:optional
	extern var rtp : Null<Bool>;
}