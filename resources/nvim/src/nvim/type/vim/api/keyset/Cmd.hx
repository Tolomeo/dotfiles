package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.cmd
	```
**/
@:structInit class Cmd {
	/**
		```lua
		(field) vim.api.keyset.cmd.addr: string?
		```
	**/
	@:optional
	extern public var addr : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.args: string[]?
		```
	**/
	@:optional
	extern public var args : Null<lua.Table<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.bang: boolean?
		```
	**/
	@:optional
	extern public var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.cmd.cmd: string?
		```
	**/
	@:optional
	extern public var cmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.count: integer?
		```
	**/
	@:optional
	extern public var count : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.cmd.magic: table<string, any>?
		```
	**/
	@:optional
	extern public var magic : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.mods: table<string, any>?
		```
	**/
	@:optional
	extern public var mods : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nargs: (string|integer)?
		```
	**/
	@:optional
	extern public var nargs : Null<haxe.extern.EitherType<Float, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nextcmd: string?
		```
	**/
	@:optional
	extern public var nextcmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.range: any[]?
		```
	**/
	@:optional
	extern public var range : Null<lua.Table<Int, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.reg: string?
		```
	**/
	@:optional
	extern public var reg : Null<String>;
}