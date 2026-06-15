package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentSymbolClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DocumentSymbolRequest}.
**/
@:structInit extern class DocumentSymbolClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document symbol supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.hierarchicalDocumentSymbolSupport: boolean?
		```
		
		---
		
		
		The client supports hierarchical document symbols.
	**/
	var hierarchicalDocumentSymbolSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.labelSupport: boolean?
		```
		
		---
		
		
		The client supports an additional label presented in the UI when
		registering a document symbol provider.
		
	**/
	var labelSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.symbolKind: (lsp.ClientSymbolKindOptions)?
		```
		
		---
		
		
		Specific capabilities for the `SymbolKind` in the
		`textDocument/documentSymbol` request.
	**/
	var symbolKind : Null<nvim.type.lsp.ClientSymbolKindOptions>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.tagSupport: (lsp.ClientSymbolTagOptions)?
		```
		
		---
		
		
		The client supports tags on `SymbolInformation`. Tags are supported on
		`DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	var tagSupport : Null<nvim.type.lsp.ClientSymbolTagOptions>;
}