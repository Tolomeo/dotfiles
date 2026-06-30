package nvim.type.lsp;

/**
	```lua
	(class) lsp.CreateFileOptions
	```
	
	---
	
	Options to create a file.
**/
@:structInit class CreateFileOptions {
	/**
		```lua
		(field) lsp.CreateFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignore if exists.
	**/
	@:optional
	extern public var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.CreateFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite existing file. Overwrite wins over `ignoreIfExists`
	**/
	@:optional
	extern public var overwrite : Null<Bool>;
}