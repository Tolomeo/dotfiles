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
	extern var abbr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.buffer: (0|1)?
		```
	**/
	@:optional
	extern var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.callback: function?
		```
	**/
	@:optional
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.desc: string?
		```
	**/
	@:optional
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.expr: (0|1)?
		```
	**/
	@:optional
	extern var expr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhs: string?
		```
	**/
	@:optional
	extern var lhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsraw: string?
		```
	**/
	@:optional
	extern var lhsraw : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsrawalt: string?
		```
	**/
	@:optional
	extern var lhsrawalt : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lnum: integer?
		```
	**/
	@:optional
	extern var lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode: string?
		```
	**/
	@:optional
	extern var mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode_bits: integer?
		```
	**/
	@:optional
	extern var mode_bits : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.noremap: (0|1)?
		```
	**/
	@:optional
	extern var noremap : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.nowait: (0|1)?
		```
	**/
	@:optional
	extern var nowait : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.rhs: string?
		```
	**/
	@:optional
	extern var rhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.script: (0|1)?
		```
	**/
	@:optional
	extern var script : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.scriptversion: integer?
		```
	**/
	@:optional
	extern var scriptversion : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.sid: integer?
		```
	**/
	@:optional
	extern var sid : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.silent: (0|1)?
		```
	**/
	@:optional
	extern var silent : Null<Float>;
}