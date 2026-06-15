package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentRangeFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentRangeFormattingRequest}.
**/
@:structInit extern class DocumentRangeFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.rangesSupport: boolean?
		```
		
		---
		
		
		Whether the server supports formatting multiple ranges at once.
		
	**/
	var rangesSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}