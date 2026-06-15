package nvim.type.lsp;

/**
	```lua
	(class) lsp.FileOperationPatternOptions
	```
	
	---
	
	Matching options for the file operation pattern.
	
**/
@:structInit extern class FileOperationPatternOptions {
	/**
		```lua
		(field) lsp.FileOperationPatternOptions.ignoreCase: boolean?
		```
		
		---
		
		
		The pattern should be matched ignoring casing.
	**/
	var ignoreCase : Null<Bool>;
}