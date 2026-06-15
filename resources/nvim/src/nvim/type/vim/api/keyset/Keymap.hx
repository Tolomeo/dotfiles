package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.keymap
	```
**/
@:structInit extern class Keymap {
	/**
		```lua
		(field) vim.api.keyset.keymap.callback: function?
		```
	**/
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.keymap.desc: string?
		```
	**/
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.keymap.expr: boolean?
		```
	**/
	var expr : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.noremap: boolean?
		```
	**/
	var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.nowait: boolean?
		```
	**/
	var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.replace_keycodes: boolean?
		```
	**/
	var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.script: boolean?
		```
	**/
	var script : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.silent: boolean?
		```
	**/
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.unique: boolean?
		```
	**/
	var unique : Null<Bool>;
}