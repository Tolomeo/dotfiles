package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.keymap
	```
**/
@:structInit class Keymap {
	/**
		```lua
		(field) vim.api.keyset.keymap.callback: function?
		```
	**/
	@:optional
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.keymap.desc: string?
		```
	**/
	@:optional
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.keymap.expr: boolean?
		```
	**/
	@:optional
	extern var expr : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.noremap: boolean?
		```
	**/
	@:optional
	extern var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.nowait: boolean?
		```
	**/
	@:optional
	extern var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.replace_keycodes: boolean?
		```
	**/
	@:optional
	extern var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.script: boolean?
		```
	**/
	@:optional
	extern var script : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.silent: boolean?
		```
	**/
	@:optional
	extern var silent : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.unique: boolean?
		```
	**/
	@:optional
	extern var unique : Null<Bool>;
}