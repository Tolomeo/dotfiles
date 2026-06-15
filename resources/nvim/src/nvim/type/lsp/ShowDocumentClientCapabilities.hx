package nvim.type.lsp;

/**
	```lua
	(class) lsp.ShowDocumentClientCapabilities
	```
	
	---
	
	Client capabilities for the showDocument request.
	
**/
@:structInit extern class ShowDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.ShowDocumentClientCapabilities.support: boolean
		```
		
		---
		
		
		The client has support for the showDocument
		request.
	**/
	var support : Bool;
}