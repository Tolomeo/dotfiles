package nvim.module.vim.lsp;

extern class Log {
	/**
		```lua
		(global) vim.lsp.log.DEBUG: unknown
		```
	**/
	var DEBUG : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.ERROR: unknown
		```
	**/
	var ERROR : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.INFO: unknown
		```
	**/
	var INFO : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.OFF: unknown
		```
	**/
	var OFF : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.TRACE: unknown
		```
	**/
	var TRACE : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.WARN: unknown
		```
	**/
	var WARN : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.debug: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	@:luaDotMethod
	function debug(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.error: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	@:luaDotMethod
	function error(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		function log.get_filename()
		  -> log: string
		```
		
		---
		
		 Returns the log filename.
		
		@*return* `log` — filename
	**/
	@:luaDotMethod
	function get_filename():String;
	/**
		```lua
		function log.get_level()
		  -> current: integer
		```
		
		---
		
		 Gets the current log level.
		
		@*return* `current` — log level
	**/
	@:luaDotMethod
	function get_level():Float;
	/**
		```lua
		(global) vim.lsp.log.info: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	@:luaDotMethod
	function info(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.levels: table<integer, string>|table<string, integer>
		```
		
		---
		
		 Log level dictionary with reverse lookup as well.
		
		 Can be used to lookup the number from the name or the name from the number.
		 Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
		 Level numbers begin with "TRACE" at 0
		 @nodoc
	**/
	var levels : haxe.extern.EitherType<lua.Table<String, Float>, lua.Table<Float, String>>;
	/**
		```lua
		function log.set_format_func(handle: function)
		```
		
		---
		
		 Sets formatting function used to format logs
		
		@*param* `handle` — function to apply to logging arguments, pass vim.inspect for multi-line formatting
	**/
	@:luaDotMethod
	function set_format_func(handle:haxe.Constraints.Function):Dynamic;
	/**
		```lua
		function log.set_level(level: string|integer)
		```
		
		---
		
		 Sets the current log level.
		
		@*param* `level` — One of |vim.log.levels|
	**/
	@:luaDotMethod
	function set_level(level:haxe.extern.EitherType<String, Float>):Dynamic;
	/**
		```lua
		function log.should_log(level: integer)
		  -> boolean
		```
		
		---
		
		 Checks whether the level is sufficient for logging.
		
		@*param* `level` — log level
		
		@*return* — : true if would log, false if not
	**/
	@:luaDotMethod
	function should_log(level:Float):Bool;
	/**
		```lua
		(global) vim.lsp.log.trace: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	@:luaDotMethod
	function trace(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.warn: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	@:luaDotMethod
	function warn(___:haxe.Rest<Any>):Null<Bool>;
}