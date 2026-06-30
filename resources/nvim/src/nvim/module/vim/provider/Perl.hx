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
	@:native("detect")
	@:luaDotMethod
	private function __detect():nvim.helper.Multireturn<Null<String>, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
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
	inline function detect():nvim.helper.Multireturn.Return2<Null<String>, Null<String>> {
		final result = __detect();
		return new nvim.helper.Multireturn.Return2<Null<String>, Null<String>>(result._0, result._1);
	}
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