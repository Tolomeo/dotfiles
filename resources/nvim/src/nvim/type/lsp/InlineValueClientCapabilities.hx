package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineValueClientCapabilities
	```
	
	---
	
	Client capabilities specific to inline values.
	
**/
@:structInit extern class InlineValueClientCapabilities {
	/**
		```lua
		(field) lsp.InlineValueClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for inline value providers.
	**/
	var dynamicRegistration : Null<Bool>;
}