package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceOptions
	```
	
	---
	
	Defines workspace specific capabilities of the server.
	
**/
@:structInit extern class WorkspaceOptions {
	/**
		```lua
		(field) lsp.WorkspaceOptions.fileOperations: (lsp.FileOperationOptions)?
		```
		
		---
		
		Options for notifications/requests for user operations on files.
		
		
		---
		
		
		The server is interested in notifications/requests for operations on files.
		
	**/
	var fileOperations : Null<nvim.type.lsp.FileOperationOptions>;
	/**
		```lua
		(field) lsp.WorkspaceOptions.textDocumentContent: (lsp.TextDocumentContentOptions|lsp.TextDocumentContentRegistrationOptions)?
		```
		
		---
		
		Text document content provider options.
		
		
		---
		
		
		The server supports the `workspace/textDocumentContent` request.
		
		
		---
		
		Text document content provider registration options.
		
	**/
	var textDocumentContent : Null<haxe.extern.EitherType<nvim.type.lsp.TextDocumentContentOptions, nvim.type.lsp.TextDocumentContentRegistrationOptions>>;
	/**
		```lua
		(field) lsp.WorkspaceOptions.workspaceFolders: (lsp.WorkspaceFoldersServerCapabilities)?
		```
		
		---
		
		
		The server supports workspace folder.
		
	**/
	var workspaceFolders : Null<nvim.type.lsp.WorkspaceFoldersServerCapabilities>;
}