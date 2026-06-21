package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemResolveOptions
	```
**/
@:structInit class ClientCompletionItemResolveOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}