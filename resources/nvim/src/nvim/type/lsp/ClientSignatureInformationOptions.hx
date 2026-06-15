package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSignatureInformationOptions
	```
**/
@:structInit extern class ClientSignatureInformationOptions {
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.activeParameterSupport: boolean?
		```
		
		---
		
		
		The client supports the `activeParameter` property on `SignatureInformation`
		literal.
		
	**/
	var activeParameterSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.documentationFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the documentation
		property. The order describes the preferred format of the client.
	**/
	var documentationFormat : Null<Array<nvim.type.lsp.MarkupKind>>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.noActiveParameterSupport: boolean?
		```
		
		---
		
		
		The client supports the `activeParameter` property on
		`SignatureHelp`/`SignatureInformation` being set to `null` to
		indicate that no parameter should be active.
		
	**/
	var noActiveParameterSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.parameterInformation: (lsp.ClientSignatureParameterInformationOptions)?
		```
		
		---
		
		
		Client capabilities specific to parameter information.
	**/
	var parameterInformation : Null<nvim.type.lsp.ClientSignatureParameterInformationOptions>;
}