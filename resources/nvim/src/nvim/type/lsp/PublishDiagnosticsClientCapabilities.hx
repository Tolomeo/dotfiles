package nvim.type.lsp;

/**
	```lua
	(class) lsp.PublishDiagnosticsClientCapabilities
	```
	
	---
	
	The publish diagnostic client capabilities.
**/
@:structInit extern class PublishDiagnosticsClientCapabilities {
	/**
		```lua
		(field) lsp.PublishDiagnosticsClientCapabilities.codeDescriptionSupport: boolean?
		```
		
		---
		
		
		Client supports a codeDescription property
		
	**/
	var codeDescriptionSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsClientCapabilities.dataSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `data` property which is
		preserved between a `textDocument/publishDiagnostics` and
		`textDocument/codeAction` request.
		
	**/
	var dataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsClientCapabilities.relatedInformation: boolean?
		```
		
		---
		
		
		Whether the clients accepts diagnostics with related information.
	**/
	var relatedInformation : Null<Bool>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsClientCapabilities.tagSupport: (lsp.ClientDiagnosticsTagOptions)?
		```
		
		---
		
		
		Client supports the tag property to provide meta data about a diagnostic.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	var tagSupport : Null<nvim.type.lsp.ClientDiagnosticsTagOptions>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsClientCapabilities.versionSupport: boolean?
		```
		
		---
		
		
		Whether the client interprets the version property of the
		`textDocument/publishDiagnostics` notification's parameter.
		
	**/
	var versionSupport : Null<Bool>;
}