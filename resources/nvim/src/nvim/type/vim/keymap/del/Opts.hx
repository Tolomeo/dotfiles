package nvim.type.vim.keymap.del;

/**
	```lua
	(class) vim.keymap.del.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.keymap.del.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Remove a mapping from the given buffer.
		 When `0` or `true`, use the current buffer.
	**/
	@:optional
	extern public var buffer : Null<haxe.extern.EitherType<Float, Bool>>;
}