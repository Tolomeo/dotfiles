package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeLensResolveOptions
	```
**/
@:structInit extern class ClientCodeLensResolveOptions {
	/**
		```lua
		(field) lsp.ClientCodeLensResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	var properties : Array<String>;
}