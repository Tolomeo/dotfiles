package nvim.type.lsp;

/**
	```lua
	(class) lsp.HoverClientCapabilities
	```
**/
@:structInit class HoverClientCapabilities {
	/**
		```lua
		(field) lsp.HoverClientCapabilities.contentFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the content
		property. The order describes the preferred format of the client.
	**/
	@:optional
	extern var contentFormat : Null<Array<nvim.type.lsp.MarkupKind>>;
	/**
		```lua
		(field) lsp.HoverClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether hover supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}