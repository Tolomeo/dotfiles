package nvim.type.vim.keymap.del;

/**
	```lua
	(class) vim.keymap.del.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.keymap.del.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Remove a mapping from the given buffer.
		 When `0` or `true`, use the current buffer.
	**/
	var buffer : Null<haxe.extern.EitherType<Int, Bool>>;
}