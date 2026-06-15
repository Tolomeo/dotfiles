package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationRegistrationOptions
	```
	
	---
	
	The options to register for file operations.
	
**/
@:structInit extern class FileOperationRegistrationOptions {
	/**
		```lua
		(field) lsp.FileOperationRegistrationOptions.filters: lsp.FileOperationFilter[]
		```
		
		---
		
		
		The actual filters.
	**/
	var filters : Array<nvim.type.lsp.FileOperationFilter>;
}