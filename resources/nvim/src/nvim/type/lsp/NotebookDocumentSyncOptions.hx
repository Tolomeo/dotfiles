package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentSyncOptions
	```
	
	---
	
	Options specific to a notebook plus its cells
	to be synced to the server.
	
	If a selector provides a notebook document
	filter but no cell selector all cells of a
	matching notebook document will be synced.
	
	If a selector provides no notebook document
	filter but only a cell selector all notebook
	document that contain at least one matching
	cell will be synced.
	
**/
@:structInit class NotebookDocumentSyncOptions {
	/**
		```lua
		(field) lsp.NotebookDocumentSyncOptions.notebookSelector: (lsp.NotebookDocumentFilterWithCells|lsp.NotebookDocumentFilterWithNotebook)[]
		```
		
		---
		
		
		The notebooks to be synced
	**/
	extern var notebookSelector : Array<haxe.extern.EitherType<nvim.type.lsp.NotebookDocumentFilterWithNotebook, nvim.type.lsp.NotebookDocumentFilterWithCells>>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncOptions.save: boolean?
		```
		
		---
		
		
		Whether save notification should be forwarded to
		the server. Will only be honored if mode === `notebook`.
	**/
	@:optional
	extern var save : Null<Bool>;
}