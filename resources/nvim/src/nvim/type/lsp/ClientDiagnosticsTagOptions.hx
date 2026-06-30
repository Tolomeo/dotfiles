package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientDiagnosticsTagOptions
	```
**/
@:structInit class ClientDiagnosticsTagOptions {
	/**
		```lua
		(field) lsp.ClientDiagnosticsTagOptions.valueSet: 1|2[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern public var valueSet : lua.Table<Int, nvim.type.lsp.DiagnosticTag>;
}