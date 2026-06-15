package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeLensClientCapabilities
	```
	
	---
	
	The client capabilities  of a {@link CodeLensRequest}.
**/
@:structInit extern class CodeLensClientCapabilities {
	/**
		```lua
		(field) lsp.CodeLensClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether code lens supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeLensClientCapabilities.resolveSupport: (lsp.ClientCodeLensResolveOptions)?
		```
		
		---
		
		
		Whether the client supports resolving additional code lens
		properties via a separate `codeLens/resolve` request.
		
	**/
	var resolveSupport : Null<nvim.type.lsp.ClientCodeLensResolveOptions>;
}