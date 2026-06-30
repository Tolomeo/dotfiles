package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentSyncClientCapabilities
	```
	
	---
	
	Notebook specific client capabilities.
	
**/
@:structInit class NotebookDocumentSyncClientCapabilities {
	/**
		```lua
		(field) lsp.NotebookDocumentSyncClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is
		set to `true` the client supports the new
		`(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncClientCapabilities.executionSummarySupport: boolean?
		```
		
		---
		
		
		The client supports sending execution summary data per cell.
	**/
	@:optional
	extern public var executionSummarySupport : Null<Bool>;
}