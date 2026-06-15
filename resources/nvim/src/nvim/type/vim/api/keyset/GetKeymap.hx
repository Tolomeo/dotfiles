package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_keymap
	```
**/
@:structInit extern class GetKeymap {
	/**
		```lua
		(field) vim.api.keyset.get_keymap.abbr: (0|1)?
		```
	**/
	var abbr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.buffer: (0|1)?
		```
	**/
	var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.callback: function?
		```
	**/
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.desc: string?
		```
	**/
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.expr: (0|1)?
		```
	**/
	var expr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhs: string?
		```
	**/
	var lhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsraw: string?
		```
	**/
	var lhsraw : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsrawalt: string?
		```
	**/
	var lhsrawalt : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lnum: integer?
		```
	**/
	var lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode: string?
		```
	**/
	var mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode_bits: integer?
		```
	**/
	var mode_bits : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.noremap: (0|1)?
		```
	**/
	var noremap : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.nowait: (0|1)?
		```
	**/
	var nowait : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.rhs: string?
		```
	**/
	var rhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.script: (0|1)?
		```
	**/
	var script : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.scriptversion: integer?
		```
	**/
	var scriptversion : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.sid: integer?
		```
	**/
	var sid : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.silent: (0|1)?
		```
	**/
	var silent : Null<Float>;
}