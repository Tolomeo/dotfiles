package nvim.module.vim.provider;

extern class Python {
	/**
		```lua
		function M.call(method: any, args: any)
		  -> nil
		```
	**/
	@:luaDotMethod
	function call(method:Dynamic, args:Dynamic):Dynamic;
	/**
		```lua
		function M.detect_by_module(module: string)
		  -> path: string?
		  2. error: string?
		```
		
		---
		
		@*return* `path` — to detected python, if any; nil if not found
		
		@*return* `error` — message if python can't be detected by {module}; nil if success
	**/
	@:luaDotMethod
	function detect_by_module(module:String):nvim.helper.Multireturn<Null<String>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		function M.require(host: any)
		```
	**/
	@:luaDotMethod
	function require(host:Dynamic):Dynamic;
	/**
		```lua
		function M.start()
		```
	**/
	@:luaDotMethod
	function start():Dynamic;
}