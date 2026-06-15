package nvim.type.vim.api.keyset.get_autocmds;

/**
	```lua
	(class) vim.api.keyset.get_autocmds.ret
	```
**/
@:structInit extern class Ret {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buffer: integer?
		```
	**/
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buflocal: boolean?
		```
	**/
	var buflocal : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.callback: function?
		```
	**/
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.command: string?
		```
	**/
	var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.desc: string?
		```
	**/
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.event: string?
		```
	**/
	var event : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group: integer?
		```
	**/
	var group : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group_name: integer?
		```
	**/
	var group_name : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.id: integer?
		```
	**/
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.once: boolean?
		```
	**/
	var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.pattern: string?
		```
	**/
	var pattern : Null<String>;
}