package nvim.type.lsp;

/**
	```lua
	(class) lsp.SaveOptions
	```
	
	---
	
	Save options.
**/
@:structInit extern class SaveOptions {
	/**
		```lua
		(field) lsp.SaveOptions.includeText: boolean?
		```
		
		---
		
		
		The client is supposed to include the content on save.
	**/
	var includeText : Null<Bool>;
}