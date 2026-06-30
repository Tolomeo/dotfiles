package nvim.type.vim.loader;

/**
	```lua
	(class) vim.loader.ModuleInfo
	```
**/
@:structInit class ModuleInfo {
	/**
		```lua
		(field) vim.loader.ModuleInfo.modname: string
		```
		
		---
		
		
		 Name of the module
	**/
	extern public var modname : String;
	/**
		```lua
		(field) vim.loader.ModuleInfo.modpath: string
		```
		
		---
		
		 @inlinedoc
		
		 Path of the module
	**/
	extern public var modpath : String;
	/**
		```lua
		(field) vim.loader.ModuleInfo.stat: (uv.fs_stat.result)?
		```
		
		---
		
		
		 The fs_stat of the module path. Won't be returned for `modname="*"`
	**/
	@:optional
	extern public var stat : Null<nvim.type.uv.fs_stat.Result>;
}