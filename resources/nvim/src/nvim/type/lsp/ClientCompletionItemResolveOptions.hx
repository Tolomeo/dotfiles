package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemResolveOptions
	```
**/
@:structInit extern class ClientCompletionItemResolveOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	var properties : Array<String>;
}