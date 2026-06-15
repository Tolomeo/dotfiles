package nvim.type.lsp;

/**
	```lua
	(class) lsp.OptionalVersionedTextDocumentIdentifier
	```
	
	---
	
	A text document identifier to optionally denote a specific version of a text document.
**/
@:structInit extern class OptionalVersionedTextDocumentIdentifier {
	/**
		```lua
		(field) lsp.OptionalVersionedTextDocumentIdentifier.uri: string
		```
		
		---
		
		
		The text document's uri.
	**/
	var uri : nvim.type.lsp.DocumentUri;
	/**
		```lua
		(field) lsp.OptionalVersionedTextDocumentIdentifier.version: integer|nil
		```
		
		---
		
		
		The version number of this document. If a versioned text document identifier
		is sent from the server to the client and the file is not open in the editor
		(the server has not received an open notification before) the server can send
		`null` to indicate that the version is unknown and the content on disk is the
		truth (as specified with document content ownership).
	**/
	var version : haxe.extern.EitherType<Int, nvim.type.lsp.Null>;
}