package nvim.type.vim.inspect;

/**
	```lua
	(class) vim.inspect.Opts
	```
	
	---
	
	 @nodoc
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.inspect.Opts.depth: integer?
		```
	**/
	@:optional
	extern public var depth : Null<Float>;
	/**
		```lua
		(field) vim.inspect.Opts.newline: string?
		```
	**/
	@:optional
	extern public var newline : Null<String>;
	/**
		```lua
		(field) vim.inspect.Opts.process: (fun(item: any, path: string[]):any)?
		```
		
		---
		
		```lua
		function (item: any, path: string[])
		  -> any
		```
	**/
	@:optional
	extern public var process : Null<(item:Any, path:lua.Table<Int, String>) -> Any>;
}