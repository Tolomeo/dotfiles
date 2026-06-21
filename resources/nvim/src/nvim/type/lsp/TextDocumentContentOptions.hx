package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentContentOptions
	```
	
	---
	
	Text document content provider options.
	
**/
@:structInit class TextDocumentContentOptions {
	/**
		```lua
		(field) lsp.TextDocumentContentOptions.schemes: string[]
		```
		
		---
		
		
		The schemes for which the server provides content.
	**/
	extern var schemes : Array<String>;
}