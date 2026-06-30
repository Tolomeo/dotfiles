package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentFormattingParams
	```
	
	---
	
	The parameters of a {@link DocumentFormattingRequest}.
**/
@:structInit class DocumentFormattingParams {
	/**
		```lua
		(field) lsp.DocumentFormattingParams.options: lsp.FormattingOptions
		```
		
		---
		
		Value-object describing what options formatting should use.
		
		---
		
		
		The format options.
	**/
	extern public var options : nvim.type.lsp.FormattingOptions;
	/**
		```lua
		(field) lsp.DocumentFormattingParams.textDocument: lsp.TextDocumentIdentifier
		```
		
		---
		
		A literal to identify a text document in the client.
		
		---
		
		
		The document to format.
	**/
	extern public var textDocument : nvim.type.lsp.TextDocumentIdentifier;
	/**
		```lua
		(field) lsp.DocumentFormattingParams.workDoneToken: (string|integer)?
		```
		
		---
		
		
		An optional token that a server can use to report work done progress.
	**/
	@:optional
	extern public var workDoneToken : Null<nvim.type.lsp.ProgressToken>;
}