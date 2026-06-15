package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentContentRegistrationOptions
	```
	
	---
	
	Text document content provider registration options.
	
**/
@:structInit extern class TextDocumentContentRegistrationOptions {
	/**
		```lua
		(field) lsp.TextDocumentContentRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	var id : Null<String>;
	/**
		```lua
		(field) lsp.TextDocumentContentRegistrationOptions.schemes: string[]
		```
		
		---
		
		
		The schemes for which the server provides content.
	**/
	var schemes : Array<String>;
}