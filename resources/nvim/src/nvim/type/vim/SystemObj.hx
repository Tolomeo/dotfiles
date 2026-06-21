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
	extern var cmd : Array<String>;
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
	extern function is_closing():Bool;
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
	extern function kill(signal:haxe.extern.EitherType<Int, String>):Dynamic;
	/**
		```lua
		(field) vim.SystemObj.pid: integer
		```
	**/
	extern var pid : Int;
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
	extern function wait(timeout:Int):nvim.type.vim.SystemCompleted;
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
	extern function write(data:haxe.extern.EitherType<String, Array<String>>):Dynamic;
}