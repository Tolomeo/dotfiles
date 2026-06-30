package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSymbolResolveOptions
	```
**/
@:structInit class ClientSymbolResolveOptions {
	/**
		```lua
		(field) lsp.ClientSymbolResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily. Usually
		`location.range`
	**/
	extern public var properties : lua.Table<Int, String>;
}