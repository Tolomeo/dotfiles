package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeLensResolveOptions
	```
**/
@:structInit class ClientCodeLensResolveOptions {
	/**
		```lua
		(field) lsp.ClientCodeLensResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}