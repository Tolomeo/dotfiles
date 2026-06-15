package nvim.type.lsp;

/**
	```lua
	(class) lsp.DeleteFileOptions
	```
	
	---
	
	Delete file options
**/
@:structInit extern class DeleteFileOptions {
	/**
		```lua
		(field) lsp.DeleteFileOptions.ignoreIfNotExists: boolean?
		```
		
		---
		
		
		Ignore the operation if the file doesn't exist.
	**/
	var ignoreIfNotExists : Null<Bool>;
	/**
		```lua
		(field) lsp.DeleteFileOptions.recursive: boolean?
		```
		
		---
		
		
		Delete the content recursively if a folder is denoted.
	**/
	var recursive : Null<Bool>;
}