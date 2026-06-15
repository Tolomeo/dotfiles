package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceSymbolClientCapabilities
	```
	
	---
	
	Client capabilities for a {@link WorkspaceSymbolRequest}.
**/
@:structInit extern class WorkspaceSymbolClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Symbol request supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.resolveSupport: (lsp.ClientSymbolResolveOptions)?
		```
		
		---
		
		
		The client support partial workspace symbols. The client will send the
		request `workspaceSymbol/resolve` to the server to resolve additional
		properties.
		
	**/
	var resolveSupport : Null<nvim.type.lsp.ClientSymbolResolveOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.symbolKind: (lsp.ClientSymbolKindOptions)?
		```
		
		---
		
		
		Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
	**/
	var symbolKind : Null<nvim.type.lsp.ClientSymbolKindOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.tagSupport: (lsp.ClientSymbolTagOptions)?
		```
		
		---
		
		
		The client supports tags on `SymbolInformation`.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	var tagSupport : Null<nvim.type.lsp.ClientSymbolTagOptions>;
}