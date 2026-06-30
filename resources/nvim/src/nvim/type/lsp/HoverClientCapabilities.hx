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
	extern public var contentFormat : Null<lua.Table<Int, nvim.type.lsp.MarkupKind>>;
	/**
		```lua
		(field) lsp.HoverClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether hover supports dynamic registration.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
}