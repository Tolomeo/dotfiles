package nvim.type.lsp;

/**
	```lua
	(class) lsp.SignatureHelpClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link SignatureHelpRequest}.
**/
@:structInit extern class SignatureHelpClientCapabilities {
	/**
		```lua
		(field) lsp.SignatureHelpClientCapabilities.contextSupport: boolean?
		```
		
		---
		
		
		The client supports to send additional context information for a
		`textDocument/signatureHelp` request. A client that opts into
		contextSupport will also support the `retriggerCharacters` on
		`SignatureHelpOptions`.
		
	**/
	var contextSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.SignatureHelpClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether signature help supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.SignatureHelpClientCapabilities.signatureInformation: (lsp.ClientSignatureInformationOptions)?
		```
		
		---
		
		
		The client supports the following `SignatureInformation`
		specific properties.
	**/
	var signatureInformation : Null<nvim.type.lsp.ClientSignatureInformationOptions>;
}