package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceClientCapabilities
	```
	
	---
	
	Workspace specific client capabilities.
**/
@:structInit extern class WorkspaceClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.applyEdit: boolean?
		```
		
		---
		
		
		The client supports applying batch edits
		to the workspace by supporting the request
		'workspace/applyEdit'
	**/
	var applyEdit : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.codeLens: (lsp.CodeLensWorkspaceClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the code lens requests scoped to the
		workspace.
		
	**/
	var codeLens : Null<nvim.type.lsp.CodeLensWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.configuration: boolean?
		```
		
		---
		
		
		The client supports `workspace/configuration` requests.
		
	**/
	var configuration : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.diagnostics: (lsp.DiagnosticWorkspaceClientCapabilities)?
		```
		
		---
		
		Workspace client capabilities specific to diagnostic pull requests.
		
		
		---
		
		
		Capabilities specific to the diagnostic requests scoped to the
		workspace.
		
	**/
	var diagnostics : Null<nvim.type.lsp.DiagnosticWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.didChangeConfiguration: (lsp.DidChangeConfigurationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `workspace/didChangeConfiguration` notification.
	**/
	var didChangeConfiguration : Null<nvim.type.lsp.DidChangeConfigurationClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.didChangeWatchedFiles: (lsp.DidChangeWatchedFilesClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
	**/
	var didChangeWatchedFiles : Null<nvim.type.lsp.DidChangeWatchedFilesClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.executeCommand: (lsp.ExecuteCommandClientCapabilities)?
		```
		
		---
		
		The client capabilities of a {@link ExecuteCommandRequest}.
		
		---
		
		
		Capabilities specific to the `workspace/executeCommand` request.
	**/
	var executeCommand : Null<nvim.type.lsp.ExecuteCommandClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.fileOperations: (lsp.FileOperationClientCapabilities)?
		```
		
		---
		
		Capabilities relating to events from file operations by the user in the client.
		
		These events do not come from the file system, they come from user operations
		like renaming a file in the UI.
		
		
		---
		
		
		The client has support for file notifications/requests for user operations on files.
		
		Since 3.16.0
	**/
	var fileOperations : Null<nvim.type.lsp.FileOperationClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.foldingRange: (lsp.FoldingRangeWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to folding ranges
		
		
		---
		
		
		Capabilities specific to the folding range requests scoped to the workspace.
		
	**/
	var foldingRange : Null<nvim.type.lsp.FoldingRangeWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.inlayHint: (lsp.InlayHintWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to inlay hints.
		
		
		---
		
		
		Capabilities specific to the inlay hint requests scoped to the
		workspace.
		
	**/
	var inlayHint : Null<nvim.type.lsp.InlayHintWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.inlineValue: (lsp.InlineValueWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to inline values.
		
		
		---
		
		
		Capabilities specific to the inline values requests scoped to the
		workspace.
		
	**/
	var inlineValue : Null<nvim.type.lsp.InlineValueWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.semanticTokens: (lsp.SemanticTokensWorkspaceClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the semantic token requests scoped to the
		workspace.
		
	**/
	var semanticTokens : Null<nvim.type.lsp.SemanticTokensWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.symbol: (lsp.WorkspaceSymbolClientCapabilities)?
		```
		
		---
		
		Client capabilities for a {@link WorkspaceSymbolRequest}.
		
		---
		
		
		Capabilities specific to the `workspace/symbol` request.
	**/
	var symbol : Null<nvim.type.lsp.WorkspaceSymbolClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.textDocumentContent: (lsp.TextDocumentContentClientCapabilities)?
		```
		
		---
		
		Client capabilities for a text document content provider.
		
		
		---
		
		
		Capabilities specific to the `workspace/textDocumentContent` request.
		
	**/
	var textDocumentContent : Null<nvim.type.lsp.TextDocumentContentClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.workspaceEdit: (lsp.WorkspaceEditClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to `WorkspaceEdit`s.
	**/
	var workspaceEdit : Null<nvim.type.lsp.WorkspaceEditClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.workspaceFolders: boolean?
		```
		
		---
		
		
		The client has support for workspace folders.
		
	**/
	var workspaceFolders : Null<Bool>;
}