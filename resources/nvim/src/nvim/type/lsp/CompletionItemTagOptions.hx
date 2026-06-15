package nvim.type.lsp;

/**
	```lua
	(class) lsp.CompletionItemTagOptions
	```
**/
@:structInit extern class CompletionItemTagOptions {
	/**
		```lua
		(field) lsp.CompletionItemTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	var valueSet : Array<nvim.type.lsp.CompletionItemTag>;
}