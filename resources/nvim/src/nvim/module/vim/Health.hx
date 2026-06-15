package nvim.module.vim;

extern class Health {
	/**
		```lua
		function M.error(msg: string, ...string|string[])
		```
		
		---
		
		 Reports an error.
		
		@*param* `...` — Optional advice
	**/
	@:luaDotMethod
	function error(msg:String, ___:haxe.Rest<haxe.extern.EitherType<String, Array<String>>>):Dynamic;
	/**
		```lua
		function M.info(msg: string)
		```
		
		---
		
		 Reports an informational message.
	**/
	@:luaDotMethod
	function info(msg:String):Dynamic;
	/**
		```lua
		function M.ok(msg: string)
		```
		
		---
		
		 Reports a "success" message.
	**/
	@:luaDotMethod
	function ok(msg:String):Dynamic;
	/**
		```lua
		function M.start(name: string)
		```
		
		---
		
		 Starts a new report. Most plugins should call this only once, but if
		 you want different sections to appear in your report, call this once
		 per section.
	**/
	@:luaDotMethod
	function start(name:String):Dynamic;
	/**
		```lua
		function M.warn(msg: string, ...string|string[])
		```
		
		---
		
		 Reports a warning.
		
		@*param* `...` — Optional advice
	**/
	@:luaDotMethod
	function warn(msg:String, ___:haxe.Rest<haxe.extern.EitherType<String, Array<String>>>):Dynamic;
}