package nvim.type.vim;

/**
	```lua
	(class) vim.SystemObj
	```
**/
@:structInit class SystemObj {
	/**
		```lua
		(field) vim.SystemObj.cmd: string[]
		```
	**/
	extern public var cmd : lua.Table<Int, String>;
	/**
		```lua
		(field) vim.SystemObj.is_closing: fun(self: vim.SystemObj):boolean
		```
		
		---
		
		```lua
		function (self: vim.SystemObj)
		  -> boolean
		```
	**/
	@:luaDotMethod
	extern public function is_closing():Bool;
	/**
		```lua
		(field) vim.SystemObj.kill: fun(self: vim.SystemObj, signal: string|integer)
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, signal: string|integer)
		```
	**/
	@:luaDotMethod
	extern public function kill(signal:haxe.extern.EitherType<Float, String>):Dynamic;
	/**
		```lua
		(field) vim.SystemObj.pid: integer
		```
	**/
	extern public var pid : Float;
	/**
		```lua
		(field) vim.SystemObj.wait: fun(self: vim.SystemObj, timeout?: integer):vim.SystemCompleted
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, timeout?: integer)
		  -> vim.SystemCompleted
		```
	**/
	@:luaDotMethod
	extern public function wait(timeout:Float):nvim.type.vim.SystemCompleted;
	/**
		```lua
		(field) vim.SystemObj.write: fun(self: vim.SystemObj, data?: string|string[])
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, data?: string|string[])
		```
	**/
	@:luaDotMethod
	extern public function write(data:haxe.extern.EitherType<String, lua.Table<Int, String>>):Dynamic;
}