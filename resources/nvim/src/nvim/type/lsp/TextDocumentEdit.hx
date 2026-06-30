package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentEdit
	```
	
	---
	
	Describes textual changes on a text document. A TextDocumentEdit describes all changes
	on a document version Si and after they are applied move the document to version Si+1.
	So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
	kind of ordering. However the edits must be non overlapping.
**/
@:structInit class TextDocumentEdit {
	/**
		```lua
		(field) lsp.TextDocumentEdit.edits: (lsp.AnnotatedTextEdit|lsp.SnippetTextEdit|lsp.TextEdit)[]
		```
		
		---
		
		
		The edits to be applied.
		
		client capability.
		
		client capability.
	**/
	extern public var edits : lua.Table<Int, haxe.extern.EitherType<nvim.type.lsp.TextEdit, haxe.extern.EitherType<nvim.type.lsp.AnnotatedTextEdit, nvim.type.lsp.SnippetTextEdit>>>;
	/**
		```lua
		(field) lsp.TextDocumentEdit.textDocument: lsp.OptionalVersionedTextDocumentIdentifier
		```
		
		---
		
		A text document identifier to optionally denote a specific version of a text document.
		
		---
		
		
		The text document to change.
	**/
	extern public var textDocument : nvim.type.lsp.OptionalVersionedTextDocumentIdentifier;
}