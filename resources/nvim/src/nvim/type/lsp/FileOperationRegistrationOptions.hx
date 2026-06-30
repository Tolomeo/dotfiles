package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationRegistrationOptions
	```
	
	---
	
	The options to register for file operations.
	
**/
@:structInit class FileOperationRegistrationOptions {
	/**
		```lua
		(field) lsp.FileOperationRegistrationOptions.filters: lsp.FileOperationFilter[]
		```
		
		---
		
		
		The actual filters.
	**/
	extern public var filters : lua.Table<Int, nvim.type.lsp.FileOperationFilter>;
}