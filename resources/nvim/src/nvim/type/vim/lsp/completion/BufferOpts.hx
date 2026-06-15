package nvim.type.vim.lsp.completion;

/**
	```lua
	(class) vim.lsp.completion.BufferOpts
	```
	
	---
	
	 @inlinedoc
**/
@:structInit extern class BufferOpts {
	/**
		```lua
		(field) vim.lsp.completion.BufferOpts.autotrigger: boolean?
		```
		
		---
		
		(default: false) When true, completion triggers automatically based on the server's `triggerCharacters`.
	**/
	var autotrigger : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.completion.BufferOpts.convert: (fun(item: lsp.CompletionItem):table)?
		```
		
		---
		
		Transforms an LSP CompletionItem to |complete-items|.
		
		---
		
		```lua
		function (item: lsp.CompletionItem)
		  -> table
		```
	**/
	var convert : Null<(item:nvim.type.lsp.CompletionItem) -> lua.Table.AnyTable>;
}