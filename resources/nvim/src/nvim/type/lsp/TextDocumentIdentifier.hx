package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentIdentifier
	```
	
	---
	
	A literal to identify a text document in the client.
**/
@:structInit class TextDocumentIdentifier {
	/**
		```lua
		(field) lsp.TextDocumentIdentifier.uri: string
		```
		
		---
		
		
		The text document's uri.
	**/
	extern public var uri : nvim.type.lsp.DocumentUri;
}