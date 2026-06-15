package nvim.type.lsp;

/**
	```lua
	(class) lsp.RenameFileOptions
	```
	
	---
	
	Rename file options
**/
@:structInit extern class RenameFileOptions {
	/**
		```lua
		(field) lsp.RenameFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignores if target exists.
	**/
	var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite target if existing. Overwrite wins over `ignoreIfExists`
	**/
	var overwrite : Null<Bool>;
}