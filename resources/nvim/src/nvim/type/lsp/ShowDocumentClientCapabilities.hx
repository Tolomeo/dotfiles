package nvim.type.lsp;

/**
	```lua
	(class) lsp.ShowDocumentClientCapabilities
	```
	
	---
	
	Client capabilities for the showDocument request.
	
**/
@:structInit class ShowDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.ShowDocumentClientCapabilities.support: boolean
		```
		
		---
		
		
		The client has support for the showDocument
		request.
	**/
	extern var support : Bool;
}