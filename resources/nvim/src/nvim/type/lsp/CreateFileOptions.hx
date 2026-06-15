package nvim.type.lsp;

/**
	```lua
	(class) lsp.CreateFileOptions
	```
	
	---
	
	Options to create a file.
**/
@:structInit extern class CreateFileOptions {
	/**
		```lua
		(field) lsp.CreateFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignore if exists.
	**/
	var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.CreateFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite existing file. Overwrite wins over `ignoreIfExists`
	**/
	var overwrite : Null<Bool>;
}