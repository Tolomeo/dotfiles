package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationClientCapabilities
	```
	
	---
	
	Capabilities relating to events from file operations by the user in the client.
	
	These events do not come from the file system, they come from user operations
	like renaming a file in the UI.
	
**/
@:structInit extern class FileOperationClientCapabilities {
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.didCreate: boolean?
		```
		
		---
		
		
		The client has support for sending didCreateFiles notifications.
	**/
	var didCreate : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.didDelete: boolean?
		```
		
		---
		
		
		The client has support for sending didDeleteFiles notifications.
	**/
	var didDelete : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.didRename: boolean?
		```
		
		---
		
		
		The client has support for sending didRenameFiles notifications.
	**/
	var didRename : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether the client supports dynamic registration for file requests/notifications.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.willCreate: boolean?
		```
		
		---
		
		
		The client has support for sending willCreateFiles requests.
	**/
	var willCreate : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.willDelete: boolean?
		```
		
		---
		
		
		The client has support for sending willDeleteFiles requests.
	**/
	var willDelete : Null<Bool>;
	/**
		```lua
		(field) lsp.FileOperationClientCapabilities.willRename: boolean?
		```
		
		---
		
		
		The client has support for sending willRenameFiles requests.
	**/
	var willRename : Null<Bool>;
}