package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSymbolTagOptions
	```
**/
@:structInit class ClientSymbolTagOptions {
	/**
		```lua
		(field) lsp.ClientSymbolTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.SymbolTag>;
}