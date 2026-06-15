package nvim.type.lsp;

/**
	```lua
	(class) lsp.DiagnosticClientCapabilities
	```
	
	---
	
	Client capabilities specific to diagnostic pull requests.
	
**/
@:structInit extern class DiagnosticClientCapabilities {
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.codeDescriptionSupport: boolean?
		```
		
		---
		
		
		Client supports a codeDescription property
		
	**/
	var codeDescriptionSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dataSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `data` property which is
		preserved between a `textDocument/publishDiagnostics` and
		`textDocument/codeAction` request.
		
	**/
	var dataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedDocumentSupport: boolean?
		```
		
		---
		
		
		Whether the clients supports related documents for document diagnostic pulls.
	**/
	var relatedDocumentSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedInformation: boolean?
		```
		
		---
		
		
		Whether the clients accepts diagnostics with related information.
	**/
	var relatedInformation : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.tagSupport: (lsp.ClientDiagnosticsTagOptions)?
		```
		
		---
		
		
		Client supports the tag property to provide meta data about a diagnostic.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	var tagSupport : Null<nvim.type.lsp.ClientDiagnosticsTagOptions>;
}