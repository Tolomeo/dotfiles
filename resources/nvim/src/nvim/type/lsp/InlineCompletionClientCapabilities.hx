package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineCompletionClientCapabilities
	```
	
	---
	
	Client capabilities specific to inline completions.
	
**/
@:structInit class InlineCompletionClientCapabilities {
	/**
		```lua
		(field) lsp.InlineCompletionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for inline completion providers.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
}