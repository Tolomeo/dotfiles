package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.NS
	```
**/
@:structInit class NS {
	/**
		```lua
		(field) vim.diagnostic.NS.disabled: boolean?
		```
	**/
	@:optional
	extern var disabled : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.NS.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.diagnostic.NS.opts: vim.diagnostic.Opts
		```
		
		---
		
		 Many of the configuration options below accept one of the following:
		 - `false`: Disable this feature
		 - `true`: Enable this feature, use default settings.
		 - `table`: Enable this feature with overrides. Use an empty table to use default values.
		 - `function`: Function with signature (namespace, bufnr) that returns any of the above.
	**/
	extern var opts : nvim.type.vim.diagnostic.Opts;
	/**
		```lua
		(field) vim.diagnostic.NS.user_data: table
		```
	**/
	extern var user_data : lua.Table.AnyTable;
}