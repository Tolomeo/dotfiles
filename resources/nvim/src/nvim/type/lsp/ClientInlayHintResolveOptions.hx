package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientInlayHintResolveOptions
	```
**/
@:structInit class ClientInlayHintResolveOptions {
	/**
		```lua
		(field) lsp.ClientInlayHintResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern public var properties : lua.Table<Int, String>;
}