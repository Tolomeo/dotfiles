package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentFormattingRequest}.
**/
@:structInit extern class DocumentFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentFormattingOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}