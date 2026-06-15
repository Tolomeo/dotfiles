package nvim.type.vim.lsp.inlay_hint.get;

/**
	```lua
	(class) vim.lsp.inlay_hint.get.Filter
	```
	
	---
	
	 Optional filters |kwargs|:
**/
@:structInit extern class Filter {
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.Filter.bufnr: integer?
		```
		
		---
		
		 @inlinedoc
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.Filter.range: (lsp.Range)?
		```
		
		---
		
		A range in a text document expressed as (zero-based) start and end positions.
		
		If you want to specify a range that contains a line including the line ending
		character(s) then use an end position denoting the start of the next line.
		For example:
		```ts
		{
		    start: { line: 5, character: 23 }
		    end : { line 6, character : 0 }
		}
		```
	**/
	var range : Null<nvim.type.lsp.Range>;
}