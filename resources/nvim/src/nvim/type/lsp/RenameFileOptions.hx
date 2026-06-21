package nvim.type.lsp;

/**
	```lua
	(class) lsp.RenameFileOptions
	```
	
	---
	
	Rename file options
**/
@:structInit class RenameFileOptions {
	/**
		```lua
		(field) lsp.RenameFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignores if target exists.
	**/
	@:optional
	extern var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite target if existing. Overwrite wins over `ignoreIfExists`
	**/
	@:optional
	extern var overwrite : Null<Bool>;
}