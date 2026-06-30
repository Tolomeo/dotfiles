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
	extern public var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.keymap.desc: string?
		```
	**/
	@:optional
	extern public var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.keymap.expr: boolean?
		```
	**/
	@:optional
	extern public var expr : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.noremap: boolean?
		```
	**/
	@:optional
	extern public var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.nowait: boolean?
		```
	**/
	@:optional
	extern public var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.replace_keycodes: boolean?
		```
	**/
	@:optional
	extern public var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.script: boolean?
		```
	**/
	@:optional
	extern public var script : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.silent: boolean?
		```
	**/
	@:optional
	extern public var silent : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.unique: boolean?
		```
	**/
	@:optional
	extern public var unique : Null<Bool>;
}