package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientInlayHintResolveOptions
	```
**/
@:structInit extern class ClientInlayHintResolveOptions {
	/**
		```lua
		(field) lsp.ClientInlayHintResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	var properties : Array<String>;
}