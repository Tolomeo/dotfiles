package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.cmd
	```
**/
@:structInit extern class Cmd {
	/**
		```lua
		(field) vim.api.keyset.cmd.addr: string?
		```
	**/
	var addr : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.args: string[]?
		```
	**/
	var args : Null<Array<String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.bang: boolean?
		```
	**/
	var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.cmd.cmd: string?
		```
	**/
	var cmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.count: integer?
		```
	**/
	var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.cmd.magic: table<string, any>?
		```
	**/
	var magic : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.mods: table<string, any>?
		```
	**/
	var mods : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nargs: (string|integer)?
		```
	**/
	var nargs : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nextcmd: string?
		```
	**/
	var nextcmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.range: any[]?
		```
	**/
	var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.reg: string?
		```
	**/
	var reg : Null<String>;
}