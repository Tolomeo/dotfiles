package nvim.type.lsp;

/**
	```lua
	(class) lsp.WindowClientCapabilities
	```
**/
@:structInit class WindowClientCapabilities {
	/**
		```lua
		(field) lsp.WindowClientCapabilities.showDocument: (lsp.ShowDocumentClientCapabilities)?
		```
		
		---
		
		Client capabilities for the showDocument request.
		
		
		---
		
		
		Capabilities specific to the showDocument request.
		
	**/
	@:optional
	extern var showDocument : Null<nvim.type.lsp.ShowDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.WindowClientCapabilities.showMessage: (lsp.ShowMessageRequestClientCapabilities)?
		```
		
		---
		
		Show message request client capabilities
		
		---
		
		
		Capabilities specific to the showMessage request.
		
	**/
	@:optional
	extern var showMessage : Null<nvim.type.lsp.ShowMessageRequestClientCapabilities>;
	/**
		```lua
		(field) lsp.WindowClientCapabilities.workDoneProgress: boolean?
		```
		
		---
		
		
		It indicates whether the client supports server initiated
		progress using the `window/workDoneProgress/create` request.
		
		The capability also controls Whether client supports handling
		of progress notifications. If set servers are allowed to report a
		`workDoneProgress` property in the request specific server
		capabilities.
		
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}