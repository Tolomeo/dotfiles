package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_keymap
	```
**/
@:structInit class GetKeymap {
	/**
		```lua
		(field) vim.api.keyset.get_keymap.abbr: (0|1)?
		```
	**/
	@:optional
	extern public var abbr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.buffer: (0|1)?
		```
	**/
	@:optional
	extern public var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.callback: function?
		```
	**/
	@:optional
	extern public var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.desc: string?
		```
	**/
	@:optional
	extern public var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.expr: (0|1)?
		```
	**/
	@:optional
	extern public var expr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhs: string?
		```
	**/
	@:optional
	extern public var lhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsraw: string?
		```
	**/
	@:optional
	extern public var lhsraw : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsrawalt: string?
		```
	**/
	@:optional
	extern public var lhsrawalt : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lnum: integer?
		```
	**/
	@:optional
	extern public var lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode: string?
		```
	**/
	@:optional
	extern public var mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode_bits: integer?
		```
	**/
	@:optional
	extern public var mode_bits : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.noremap: (0|1)?
		```
	**/
	@:optional
	extern public var noremap : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.nowait: (0|1)?
		```
	**/
	@:optional
	extern public var nowait : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.rhs: string?
		```
	**/
	@:optional
	extern public var rhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.script: (0|1)?
		```
	**/
	@:optional
	extern public var script : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.scriptversion: integer?
		```
	**/
	@:optional
	extern public var scriptversion : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.sid: integer?
		```
	**/
	@:optional
	extern public var sid : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.silent: (0|1)?
		```
	**/
	@:optional
	extern public var silent : Null<Float>;
}