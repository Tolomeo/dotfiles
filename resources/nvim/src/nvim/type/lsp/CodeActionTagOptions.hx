package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionTagOptions
	```
**/
@:structInit extern class CodeActionTagOptions {
	/**
		```lua
		(field) lsp.CodeActionTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	var valueSet : Array<nvim.type.lsp.CodeActionTag>;
}