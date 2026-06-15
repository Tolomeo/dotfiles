package nvim.type.vim;

/**
	```lua
	(class) vim.SystemObj
	```
**/
@:structInit extern class SystemObj {
	/**
		```lua
		(field) vim.SystemObj.cmd: string[]
		```
	**/
	var cmd : Array<String>;
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
	function is_closing():Bool;
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
	function kill(signal:haxe.extern.EitherType<Int, String>):Dynamic;
	/**
		```lua
		(field) vim.SystemObj.pid: integer
		```
	**/
	var pid : Int;
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
	function wait(timeout:Int):nvim.type.vim.SystemCompleted;
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
	function write(data:haxe.extern.EitherType<String, Array<String>>):Dynamic;
}