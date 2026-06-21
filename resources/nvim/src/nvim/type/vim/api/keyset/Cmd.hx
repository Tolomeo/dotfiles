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
	extern var addr : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.args: string[]?
		```
	**/
	@:optional
	extern var args : Null<Array<String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.bang: boolean?
		```
	**/
	@:optional
	extern var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.cmd.cmd: string?
		```
	**/
	@:optional
	extern var cmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.count: integer?
		```
	**/
	@:optional
	extern var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.cmd.magic: table<string, any>?
		```
	**/
	@:optional
	extern var magic : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.mods: table<string, any>?
		```
	**/
	@:optional
	extern var mods : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nargs: (string|integer)?
		```
	**/
	@:optional
	extern var nargs : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nextcmd: string?
		```
	**/
	@:optional
	extern var nextcmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.range: any[]?
		```
	**/
	@:optional
	extern var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.reg: string?
		```
	**/
	@:optional
	extern var reg : Null<String>;
}