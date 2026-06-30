package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionTagOptions
	```
**/
@:structInit class CodeActionTagOptions {
	/**
		```lua
		(field) lsp.CodeActionTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.CodeActionTag>;
}