package nvim.module.vim.provider;

extern class Perl {
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
		  -> path: string?
		  2. error: string?
		```
		
		---
		
		@*return* `path` — to detected perl, if any; nil if not found
		
		@*return* `error` — message if perl can't be detected; nil if success
	**/
	@:luaDotMethod
	function detect():nvim.helper.Multireturn<Null<String>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		function M.require(host: any, prog: any)
		```
	**/
	@:luaDotMethod
	function require(host:Dynamic, prog:Dynamic):Dynamic;
	/**
		```lua
		function M.start()
		```
	**/
	@:luaDotMethod
	function start():Dynamic;
}