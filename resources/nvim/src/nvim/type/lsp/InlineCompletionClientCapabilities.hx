package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineCompletionClientCapabilities
	```
	
	---
	
	Client capabilities specific to inline completions.
	
**/
@:structInit extern class InlineCompletionClientCapabilities {
	/**
		```lua
		(field) lsp.InlineCompletionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for inline completion providers.
	**/
	var dynamicRegistration : Null<Bool>;
}