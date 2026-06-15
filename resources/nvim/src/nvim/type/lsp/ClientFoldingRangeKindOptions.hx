package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientFoldingRangeKindOptions
	```
**/
@:structInit extern class ClientFoldingRangeKindOptions {
	/**
		```lua
		(field) lsp.ClientFoldingRangeKindOptions.valueSet: "comment"|"imports"|"region"[]?
		```
		
		---
		
		
		The folding range kind values the client supports. When this
		property exists the client also guarantees that it will
		handle values outside its set gracefully and falls back
		to a default value when unknown.
	**/
	var valueSet : Null<Array<nvim.type.lsp.FoldingRangeKind>>;
}