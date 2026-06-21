package nvim.type.vim.treesitter.get_node;

/**
	```lua
	(class) vim.treesitter.get_node.Opts
	```
	
	---
	
	 Optional keyword arguments:
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.bufnr: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Buffer number (nil or 0 for current buffer)
	**/
	@:optional
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.ignore_injections: boolean?
		```
		
		---
		
		
		 Ignore injected languages (default true)
	**/
	@:optional
	extern var ignore_injections : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.include_anonymous: boolean?
		```
		
		---
		
		
		 Include anonymous nodes (default false)
	**/
	@:optional
	extern var include_anonymous : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.lang: string?
		```
		
		---
		
		
		 Parser language. (default: from buffer filetype)
	**/
	@:optional
	extern var lang : Null<String>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.pos: [integer, integer]?
		```
		
		---
		
		
		 0-indexed (row, col) tuple. Defaults to cursor position in the
		 current window. Required if {bufnr} is not the current buffer
	**/
	extern var pos : Dynamic;
}