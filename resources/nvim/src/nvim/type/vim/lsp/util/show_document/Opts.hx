package nvim.type.vim.lsp.util.show_document;

/**
	```lua
	(class) vim.lsp.util.show_document.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.lsp.util.show_document.Opts.focus: boolean?
		```
		
		---
		
		
		 Whether to focus/jump to location if possible.
		 (defaults: true)
	**/
	var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.show_document.Opts.reuse_win: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Jump to existing window if buffer is already open.
	**/
	var reuse_win : Null<Bool>;
}