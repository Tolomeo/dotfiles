package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentSyncRegistrationOptions
	```
	
	---
	
	Registration options specific to a notebook.
	
**/
@:structInit extern class NotebookDocumentSyncRegistrationOptions {
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	var id : Null<String>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.notebookSelector: (lsp.NotebookDocumentFilterWithCells|lsp.NotebookDocumentFilterWithNotebook)[]
		```
		
		---
		
		
		The notebooks to be synced
	**/
	var notebookSelector : Array<haxe.extern.EitherType<nvim.type.lsp.NotebookDocumentFilterWithNotebook, nvim.type.lsp.NotebookDocumentFilterWithCells>>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.save: boolean?
		```
		
		---
		
		
		Whether save notification should be forwarded to
		the server. Will only be honored if mode === `notebook`.
	**/
	var save : Null<Bool>;
}