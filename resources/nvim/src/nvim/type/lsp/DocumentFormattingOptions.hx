package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentFormattingRequest}.
**/
@:structInit class DocumentFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentFormattingOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}