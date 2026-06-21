package nvim.type.vim.fn.getscriptinfo;

/**
	```lua
	(class) vim.fn.getscriptinfo.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.autoload: false
		```
	**/
	extern var autoload : Bool;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.functions: string[]?
		```
	**/
	@:optional
	extern var functions : Null<Array<String>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.sid: string
		```
	**/
	extern var sid : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.variables: table<string, any>?
		```
	**/
	@:optional
	extern var variables : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.version: 1
		```
	**/
	extern var version : Float;
}