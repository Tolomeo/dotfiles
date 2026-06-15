package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientDiagnosticsTagOptions
	```
**/
@:structInit extern class ClientDiagnosticsTagOptions {
	/**
		```lua
		(field) lsp.ClientDiagnosticsTagOptions.valueSet: 1|2[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	var valueSet : Array<nvim.type.lsp.DiagnosticTag>;
}