package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientFoldingRangeOptions
	```
**/
@:structInit class ClientFoldingRangeOptions {
	/**
		```lua
		(field) lsp.ClientFoldingRangeOptions.collapsedText: boolean?
		```
		
		---
		
		
		If set, the client signals that it supports setting collapsedText on
		folding ranges to display custom labels instead of the default text.
		
	**/
	@:optional
	extern public var collapsedText : Null<Bool>;
}