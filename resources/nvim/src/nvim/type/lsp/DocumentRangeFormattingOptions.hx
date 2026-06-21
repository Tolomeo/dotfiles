package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentRangeFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentRangeFormattingRequest}.
**/
@:structInit class DocumentRangeFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.rangesSupport: boolean?
		```
		
		---
		
		
		Whether the server supports formatting multiple ranges at once.
		
	**/
	@:optional
	extern var rangesSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}