package nvim.module.vim.provider;

extern class Ruby {
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
		function M.detect()
		  -> string
		  2. string
		```
	**/
	@:luaDotMethod
	function detect():Dynamic;
	/**
		```lua
		function M.require(host: any)
		```
	**/
	@:luaDotMethod
	function require(host:Dynamic):Dynamic;
	/**
		```lua
		function M.start(plugin_path: any)
		```
	**/
	@:luaDotMethod
	function start(plugin_path:Dynamic):Dynamic;
}