package nvim.type.vim.api.keyset.get_autocmds;

/**
	```lua
	(class) vim.api.keyset.get_autocmds.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buffer: integer?
		```
	**/
	@:optional
	extern var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buflocal: boolean?
		```
	**/
	@:optional
	extern var buflocal : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.callback: function?
		```
	**/
	@:optional
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.command: string?
		```
	**/
	@:optional
	extern var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.desc: string?
		```
	**/
	@:optional
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.event: string?
		```
	**/
	@:optional
	extern var event : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group: integer?
		```
	**/
	@:optional
	extern var group : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group_name: integer?
		```
	**/
	@:optional
	extern var group_name : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.once: boolean?
		```
	**/
	@:optional
	extern var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.pattern: string?
		```
	**/
	@:optional
	extern var pattern : Null<String>;
}