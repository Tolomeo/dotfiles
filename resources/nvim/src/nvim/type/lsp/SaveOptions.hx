package nvim.type.lsp;

/**
	```lua
	(class) lsp.SaveOptions
	```
	
	---
	
	Save options.
**/
@:structInit class SaveOptions {
	/**
		```lua
		(field) lsp.SaveOptions.includeText: boolean?
		```
		
		---
		
		
		The client is supposed to include the content on save.
	**/
	@:optional
	extern public var includeText : Null<Bool>;
}