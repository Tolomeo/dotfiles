package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookCellTextDocumentFilter
	```
	
	---
	
	A notebook cell text document filter denotes a cell text
	document by different properties.
	
**/
@:structInit class NotebookCellTextDocumentFilter {
	/**
		```lua
		(field) lsp.NotebookCellTextDocumentFilter.language: string?
		```
		
		---
		
		
		A language id like `python`.
		
		Will be matched against the language id of the
		notebook cell document. '*' matches every language.
	**/
	@:optional
	extern public var language : Null<String>;
	/**
		```lua
		(field) lsp.NotebookCellTextDocumentFilter.notebook: string|lsp.NotebookDocumentFilterNotebookType|lsp.NotebookDocumentFilterPattern|lsp.NotebookDocumentFilterScheme
		```
		
		---
		
		A notebook document filter denotes a notebook document by
		different properties. The properties will be match
		against the notebook's URI (same as with documents)
		
		
		---
		
		
		A filter that matches against the notebook
		containing the notebook cell. If a string
		value is provided it matches against the
		notebook type. '*' matches every notebook.
		
		---
		
		A notebook document filter where `notebookType` is required field.
		
		
		---
		
		A notebook document filter where `scheme` is required field.
		
		
		---
		
		A notebook document filter where `pattern` is required field.
		
	**/
	extern public var notebook : haxe.extern.EitherType<String, nvim.type.lsp.NotebookDocumentFilter>;
}