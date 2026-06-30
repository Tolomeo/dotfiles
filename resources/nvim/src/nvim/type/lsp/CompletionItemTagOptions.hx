package nvim.type.lsp;

/**
	```lua
	(class) lsp.CompletionItemTagOptions
	```
**/
@:structInit class CompletionItemTagOptions {
	/**
		```lua
		(field) lsp.CompletionItemTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.CompletionItemTag>;
}