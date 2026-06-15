package nvim.module.vim;

extern class Loader {
	/**
		```lua
		function M.disable()
		```
	**/
	@:luaDotMethod
	@:deprecated
	function disable():Dynamic;
	/**
		```lua
		function M.enable(enable?: boolean)
		```
		
		---
		
		 Enables or disables the experimental Lua module loader:
		
		 Enable (`enable=true`):
		 * overrides |loadfile()|
		 * adds the Lua loader using the byte-compilation cache
		 * adds the libs loader
		 * removes the default Nvim loader
		
		 Disable (`enable=false`):
		 * removes the loaders
		 * adds the default Nvim loader
		
		 @since 0
		
		@*param* `enable` — true/nil to enable, false to disable
	**/
	@:luaDotMethod
	function enable(?enable:Bool):Dynamic;
	/**
		```lua
		(global) vim.loader.enabled: boolean? = true|false
		```
	**/
	private var enabled : Bool;
	/**
		```lua
		function M.find(modname: string, opts?: vim.loader.find.Opts)
		  -> vim.loader.ModuleInfo[]
		```
		
		---
		
		 Finds Lua modules for the given module name.
		
		 @since 0
		
		@*param* `modname` — Module name, or `"*"` to find the top-level modules instead
		
		@*param* `opts` — Options for finding a module:
	**/
	@:luaDotMethod
	function find(modname:String, ?opts:nvim.type.vim.loader.find.Opts):Array<nvim.type.vim.loader.ModuleInfo>;
	/**
		```lua
		(global) vim.loader.path: string
		```
	**/
	var path : Dynamic;
	/**
		```lua
		function M.reset(path?: string)
		```
		
		---
		
		 Resets the cache for the path, or all the paths if path is nil.
		
		 @since 0
		
		@*param* `path` — path to reset
	**/
	@:luaDotMethod
	function reset(?path:Null<String>):Dynamic;
}