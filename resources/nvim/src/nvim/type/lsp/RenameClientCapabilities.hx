package nvim.type.lsp;

/**
	```lua
	(class) lsp.RenameClientCapabilities
	```
**/
@:structInit class RenameClientCapabilities {
	/**
		```lua
		(field) lsp.RenameClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether rename supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.honorsChangeAnnotations: boolean?
		```
		
		---
		
		
		Whether the client honors the change annotations in
		text edits and resource operations returned via the
		rename request's workspace edit by for example presenting
		the workspace edit in the user interface and asking
		for confirmation.
		
	**/
	@:optional
	extern var honorsChangeAnnotations : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.prepareSupport: boolean?
		```
		
		---
		
		
		Client supports testing for validity of rename operations
		before execution.
		
	**/
	@:optional
	extern var prepareSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.prepareSupportDefaultBehavior: 1?
		```
		
		---
		
		
		Client supports the default behavior result.
		
		The value indicates the default behavior used by the
		client.
		
		
		---
		
		```lua
		lsp.PrepareSupportDefaultBehavior:
		    | 1 -- Identifier
		```
	**/
	@:optional
	extern var prepareSupportDefaultBehavior : Null<nvim.type.lsp.PrepareSupportDefaultBehavior>;
}