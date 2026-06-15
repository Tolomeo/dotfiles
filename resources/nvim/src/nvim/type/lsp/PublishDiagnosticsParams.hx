package nvim.type.lsp;

/**
	```lua
	(class) lsp.PublishDiagnosticsParams
	```
	
	---
	
	The publish diagnostic notification's parameters.
**/
@:structInit extern class PublishDiagnosticsParams {
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.diagnostics: lsp.Diagnostic[]
		```
		
		---
		
		
		An array of diagnostic information items.
	**/
	var diagnostics : Array<nvim.type.lsp.Diagnostic>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.uri: string
		```
		
		---
		
		
		The URI for which diagnostic information is reported.
	**/
	var uri : nvim.type.lsp.DocumentUri;
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.version: integer?
		```
		
		---
		
		
		Optional the version number of the document the diagnostics are published for.
		
	**/
	var version : Null<Int>;
}