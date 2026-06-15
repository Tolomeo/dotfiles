package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineCompletionOptions
	```
	
	---
	
	Inline completion options used during static registration.
	
**/
@:structInit extern class InlineCompletionOptions {
	/**
		```lua
		(field) lsp.InlineCompletionOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}