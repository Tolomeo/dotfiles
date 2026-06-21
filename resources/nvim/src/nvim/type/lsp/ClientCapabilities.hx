package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCapabilities
	```
	
	---
	
	Defines the capabilities provided by the client.
**/
@:structInit class ClientCapabilities {
	/**
		```lua
		(field) lsp.ClientCapabilities.experimental: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		Experimental client capabilities.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	@:optional
	extern var experimental : Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(field) lsp.ClientCapabilities.general: (lsp.GeneralClientCapabilities)?
		```
		
		---
		
		General client capabilities.
		
		
		---
		
		
		General client capabilities.
		
	**/
	@:optional
	extern var general : Null<nvim.type.lsp.GeneralClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.notebookDocument: (lsp.NotebookDocumentClientCapabilities)?
		```
		
		---
		
		Capabilities specific to the notebook document support.
		
		
		---
		
		
		Capabilities specific to the notebook document support.
		
	**/
	@:optional
	extern var notebookDocument : Null<nvim.type.lsp.NotebookDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.textDocument: (lsp.TextDocumentClientCapabilities)?
		```
		
		---
		
		Text document specific client capabilities.
		
		---
		
		
		Text document specific client capabilities.
	**/
	@:optional
	extern var textDocument : Null<nvim.type.lsp.TextDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.window: (lsp.WindowClientCapabilities)?
		```
		
		---
		
		
		Window specific client capabilities.
	**/
	@:optional
	extern var window : Null<nvim.type.lsp.WindowClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.workspace: (lsp.WorkspaceClientCapabilities)?
		```
		
		---
		
		Workspace specific client capabilities.
		
		---
		
		
		Workspace specific client capabilities.
	**/
	@:optional
	extern var workspace : Null<nvim.type.lsp.WorkspaceClientCapabilities>;
}