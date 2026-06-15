package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentClientCapabilities
	```
	
	---
	
	Capabilities specific to the notebook document support.
	
**/
@:structInit extern class NotebookDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.NotebookDocumentClientCapabilities.synchronization: lsp.NotebookDocumentSyncClientCapabilities
		```
		
		---
		
		Notebook specific client capabilities.
		
		
		---
		
		
		Capabilities specific to notebook document synchronization
		
	**/
	var synchronization : nvim.type.lsp.NotebookDocumentSyncClientCapabilities;
}