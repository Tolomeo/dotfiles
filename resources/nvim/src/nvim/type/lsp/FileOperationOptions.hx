package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationOptions
	```
	
	---
	
	Options for notifications/requests for user operations on files.
	
**/
@:structInit extern class FileOperationOptions {
	/**
		```lua
		(field) lsp.FileOperationOptions.didCreate: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didCreateFiles notifications.
	**/
	var didCreate : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.didDelete: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didDeleteFiles file notifications.
	**/
	var didDelete : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.didRename: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didRenameFiles notifications.
	**/
	var didRename : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willCreate: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willCreateFiles requests.
	**/
	var willCreate : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willDelete: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willDeleteFiles file requests.
	**/
	var willDelete : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willRename: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willRenameFiles requests.
	**/
	var willRename : Null<nvim.type.lsp.FileOperationRegistrationOptions>;
}