package nvim.type.lsp;

/**
	```lua
	(class) lsp.HoverClientCapabilities
	```
**/
@:structInit extern class HoverClientCapabilities {
	/**
		```lua
		(field) lsp.HoverClientCapabilities.contentFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the content
		property. The order describes the preferred format of the client.
	**/
	var contentFormat : Null<Array<nvim.type.lsp.MarkupKind>>;
	/**
		```lua
		(field) lsp.HoverClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether hover supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
}