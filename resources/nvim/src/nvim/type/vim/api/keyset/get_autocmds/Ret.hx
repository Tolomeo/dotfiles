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
	extern public var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buflocal: boolean?
		```
	**/
	@:optional
	extern public var buflocal : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.callback: function?
		```
	**/
	@:optional
	extern public var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.command: string?
		```
	**/
	@:optional
	extern public var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.desc: string?
		```
	**/
	@:optional
	extern public var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.event: string?
		```
	**/
	@:optional
	extern public var event : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group: integer?
		```
	**/
	@:optional
	extern public var group : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group_name: integer?
		```
	**/
	@:optional
	extern public var group_name : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.once: boolean?
		```
	**/
	@:optional
	extern public var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.pattern: string?
		```
	**/
	@:optional
	extern public var pattern : Null<String>;
}