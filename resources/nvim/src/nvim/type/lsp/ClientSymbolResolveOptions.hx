package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSymbolResolveOptions
	```
**/
@:structInit extern class ClientSymbolResolveOptions {
	/**
		```lua
		(field) lsp.ClientSymbolResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily. Usually
		`location.range`
	**/
	var properties : Array<String>;
}