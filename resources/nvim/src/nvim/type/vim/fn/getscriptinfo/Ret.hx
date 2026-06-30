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
	extern public var autoload : Bool;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.functions: string[]?
		```
	**/
	@:optional
	extern public var functions : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.sid: string
		```
	**/
	extern public var sid : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.variables: table<string, any>?
		```
	**/
	@:optional
	extern public var variables : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.version: 1
		```
	**/
	extern public var version : Float;
}