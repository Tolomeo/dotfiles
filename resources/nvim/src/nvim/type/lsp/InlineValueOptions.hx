package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlineValueOptions
	```
	
	---
	
	Inline value options used during static registration.
	
**/
@:structInit class InlineValueOptions {
	/**
		```lua
		(field) lsp.InlineValueOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}