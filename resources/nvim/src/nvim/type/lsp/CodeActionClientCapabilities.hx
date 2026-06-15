package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeActionClientCapabilities
	```
	
	---
	
	The Client Capabilities of a {@link CodeActionRequest}.
**/
@:structInit extern class CodeActionClientCapabilities {
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.codeActionLiteralSupport: (lsp.ClientCodeActionLiteralOptions)?
		```
		
		---
		
		
		The client support code action literals of type `CodeAction` as a valid
		response of the `textDocument/codeAction` request. If the property is not
		set the request can only return `Command` literals.
		
	**/
	var codeActionLiteralSupport : Null<nvim.type.lsp.ClientCodeActionLiteralOptions>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.dataSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `data` property which is
		preserved between a `textDocument/codeAction` and a
		`codeAction/resolve` request.
		
	**/
	var dataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.disabledSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `disabled` property.
		
	**/
	var disabledSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.documentationSupport: boolean?
		```
		
		---
		
		
		Whether the client supports documentation for a class of
		code actions.
		
	**/
	var documentationSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether code action supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.honorsChangeAnnotations: boolean?
		```
		
		---
		
		
		Whether the client honors the change annotations in
		text edits and resource operations returned via the
		`CodeAction#edit` property by for example presenting
		the workspace edit in the user interface and asking
		for confirmation.
		
	**/
	var honorsChangeAnnotations : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.isPreferredSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `isPreferred` property.
		
	**/
	var isPreferredSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.resolveSupport: (lsp.ClientCodeActionResolveOptions)?
		```
		
		---
		
		
		Whether the client supports resolving additional code action
		properties via a separate `codeAction/resolve` request.
		
	**/
	var resolveSupport : Null<nvim.type.lsp.ClientCodeActionResolveOptions>;
	/**
		```lua
		(field) lsp.CodeActionClientCapabilities.tagSupport: (lsp.CodeActionTagOptions)?
		```
		
		---
		
		
		Client supports the tag property on a code action. Clients
		supporting tags have to handle unknown tags gracefully.
		
	**/
	var tagSupport : Null<nvim.type.lsp.CodeActionTagOptions>;
}