package nvim.type.vim.treesitter.dev.inspect_tree;

/**
	```lua
	(class) vim.treesitter.dev.inspect_tree.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.treesitter.dev.inspect_tree.Opts.bufnr: integer?
		```
		
		---
		
		
		 Buffer to draw the tree into. If omitted, a new buffer is created.
	**/
	@:optional
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.treesitter.dev.inspect_tree.Opts.command: string?
		```
		
		---
		
		
		 Vimscript command to create the window. Default value is "60vnew".
		 Only used when {winid} is nil.
	**/
	@:optional
	extern var command : Null<String>;
	/**
		```lua
		(field) vim.treesitter.dev.inspect_tree.Opts.lang: string?
		```
		
		---
		
		 @inlinedoc
		
		 The language of the source buffer. If omitted, the filetype of the source
		 buffer is used.
	**/
	@:optional
	extern var lang : Null<String>;
	/**
		```lua
		(field) vim.treesitter.dev.inspect_tree.Opts.title: string|fun(bufnr: integer):string|nil
		```
		
		---
		
		
		 Title of the window. If a function, it accepts the buffer number of the
		 source buffer as its only argument and should return a string.
		
		---
		
		```lua
		function (bufnr: integer)
		  -> string|nil
		```
	**/
	extern var title : haxe.extern.EitherType<String, (bufnr:Int) -> Null<String>>;
	/**
		```lua
		(field) vim.treesitter.dev.inspect_tree.Opts.winid: integer?
		```
		
		---
		
		
		 Window id to display the tree buffer in. If omitted, a new window is
		 created with {command}.
	**/
	@:optional
	extern var winid : Null<Int>;
}