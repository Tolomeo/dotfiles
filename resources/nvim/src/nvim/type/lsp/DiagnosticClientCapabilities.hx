package nvim.type.lsp;

/**
	```lua
	(class) lsp.DiagnosticClientCapabilities
	```
	
	---
	
	Client capabilities specific to diagnostic pull requests.
	
**/
@:structInit class DiagnosticClientCapabilities {
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.codeDescriptionSupport: boolean?
		```
		
		---
		
		
		Client supports a codeDescription property
		
	**/
	@:optional
	extern var codeDescriptionSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dataSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `data` property which is
		preserved between a `textDocument/publishDiagnostics` and
		`textDocument/codeAction` request.
		
	**/
	@:optional
	extern var dataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedDocumentSupport: boolean?
		```
		
		---
		
		
		Whether the clients supports related documents for document diagnostic pulls.
	**/
	@:optional
	extern var relatedDocumentSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedInformation: boolean?
		```
		
		---
		
		
		Whether the clients accepts diagnostics with related information.
	**/
	@:optional
	extern var relatedInformation : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.tagSupport: (lsp.ClientDiagnosticsTagOptions)?
		```
		
		---
		
		
		Client supports the tag property to provide meta data about a diagnostic.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	@:optional
	extern var tagSupport : Null<nvim.type.lsp.ClientDiagnosticsTagOptions>;
}