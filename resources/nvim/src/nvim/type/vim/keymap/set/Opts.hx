package nvim.type.vim.keymap.set;

/**
	```lua
	(class) vim.keymap.set.Opts
	```
	
	---
	
	 Table of |:map-arguments|.
	 Same as |nvim_set_keymap()| {opts}, except:
	 - {replace_keycodes} defaults to `true` if "expr" is `true`.
	
	 Also accepts:
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.keymap.set.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Creates buffer-local mapping, `0` or `true` for current buffer.
	**/
	var buffer : Null<haxe.extern.EitherType<Int, Bool>>;
	/**
		```lua
		(field) vim.keymap.set.Opts.callback: function?
		```
	**/
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.keymap.set.Opts.desc: string?
		```
	**/
	var desc : Null<String>;
	/**
		```lua
		(field) vim.keymap.set.Opts.expr: boolean?
		```
	**/
	var expr : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.noremap: boolean?
		```
	**/
	var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.nowait: boolean?
		```
	**/
	var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.remap: boolean?
		```
		
		---
		
		
		 Make the mapping recursive. Inverse of {noremap}.
		 (Default: `false`)
	**/
	var remap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.replace_keycodes: boolean?
		```
	**/
	var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.script: boolean?
		```
	**/
	var script : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.silent: boolean?
		```
	**/
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.unique: boolean?
		```
	**/
	var unique : Null<Bool>;
}