package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientShowMessageActionItemOptions
	```
**/
@:structInit extern class ClientShowMessageActionItemOptions {
	/**
		```lua
		(field) lsp.ClientShowMessageActionItemOptions.additionalPropertiesSupport: boolean?
		```
		
		---
		
		
		Whether the client supports additional attributes which
		are preserved and send back to the server in the
		request's response.
	**/
	var additionalPropertiesSupport : Null<Bool>;
}