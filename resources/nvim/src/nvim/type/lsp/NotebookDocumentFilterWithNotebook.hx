package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentFilterWithNotebook
	```
**/
@:structInit class NotebookDocumentFilterWithNotebook {
	/**
		```lua
		(field) lsp.NotebookDocumentFilterWithNotebook.cells: lsp.NotebookCellLanguage[]?
		```
		
		---
		
		
		The cells of the matching notebook to be synced.
	**/
	@:optional
	extern public var cells : Null<lua.Table<Int, nvim.type.lsp.NotebookCellLanguage>>;
	/**
		```lua
		(field) lsp.NotebookDocumentFilterWithNotebook.notebook: string|lsp.NotebookDocumentFilterNotebookType|lsp.NotebookDocumentFilterPattern|lsp.NotebookDocumentFilterScheme
		```
		
		---
		
		A notebook document filter denotes a notebook document by
		different properties. The properties will be match
		against the notebook's URI (same as with documents)
		
		
		---
		
		
		The notebook to be synced If a string
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