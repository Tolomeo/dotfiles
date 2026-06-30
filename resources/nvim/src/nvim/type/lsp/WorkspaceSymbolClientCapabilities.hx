package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceSymbolClientCapabilities
	```
	
	---
	
	Client capabilities for a {@link WorkspaceSymbolRequest}.
**/
@:structInit class WorkspaceSymbolClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Symbol request supports dynamic registration.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.resolveSupport: (lsp.ClientSymbolResolveOptions)?
		```
		
		---
		
		
		The client support partial workspace symbols. The client will send the
		request `workspaceSymbol/resolve` to the server to resolve additional
		properties.
		
	**/
	@:optional
	extern public var resolveSupport : Null<nvim.type.lsp.ClientSymbolResolveOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.symbolKind: (lsp.ClientSymbolKindOptions)?
		```
		
		---
		
		
		Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
	**/
	@:optional
	extern public var symbolKind : Null<nvim.type.lsp.ClientSymbolKindOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.tagSupport: (lsp.ClientSymbolTagOptions)?
		```
		
		---
		
		
		The client supports tags on `SymbolInformation`.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	@:optional
	extern public var tagSupport : Null<nvim.type.lsp.ClientSymbolTagOptions>;
}