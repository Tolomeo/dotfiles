package nvim.type.vim.fs.find;

/**
	```lua
	(class) vim.fs.find.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.fs.find.Opts.follow: boolean?
		```
		
		---
		
		
		 Follow symbolic links.
		 (default: `false`)
	**/
	@:optional
	extern public var follow : Null<Bool>;
	/**
		```lua
		(field) vim.fs.find.Opts.limit: number?
		```
		
		---
		
		
		 Stop the search after finding this many matches.
		 Use `math.huge` to place no limit on the number of matches.
		 (default: `1`)
	**/
	@:optional
	extern public var limit : Null<Float>;
	/**
		```lua
		(field) vim.fs.find.Opts.path: string?
		```
		
		---
		
		 @inlinedoc
		
		 Path to begin searching from. If
		 omitted, the |current-directory| is used.
	**/
	@:optional
	extern public var path : Null<String>;
	/**
		```lua
		(field) vim.fs.find.Opts.stop: string?
		```
		
		---
		
		
		 Stop searching when this directory is reached.
		 The directory itself is not searched.
	**/
	@:optional
	extern public var stop : Null<String>;
	/**
		```lua
		(field) vim.fs.find.Opts.type: string?
		```
		
		---
		
		
		 Find only items of the given type.
		 If omitted, all items that match {names} are included.
	**/
	@:optional
	extern public var type : Null<String>;
	/**
		```lua
		(field) vim.fs.find.Opts.upward: boolean?
		```
		
		---
		
		
		 Search upward through parent directories.
		 Otherwise, search through child directories (recursively).
		 (default: `false`)
	**/
	@:optional
	extern public var upward : Null<Bool>;
}