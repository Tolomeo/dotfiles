package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineCompletionOptions
	```
	
	---
	
	Inline completion options used during static registration.
	
**/
@:structInit class InlineCompletionOptions {
	/**
		```lua
		(field) lsp.InlineCompletionOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}