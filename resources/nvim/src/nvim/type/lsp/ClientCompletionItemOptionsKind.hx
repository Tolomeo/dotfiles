package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemOptionsKind
	```
**/
@:structInit extern class ClientCompletionItemOptionsKind {
	/**
		```lua
		(field) lsp.ClientCompletionItemOptionsKind.valueSet: 1|10|11|12|13|14|15|16|17|18|19|2|20|21|22|23|24|25|3|4|5|6|7|8|9[]?
		```
		
		---
		
		
		The completion item kind values the client supports. When this
		property exists the client also guarantees that it will
		handle values outside its set gracefully and falls back
		to a default value when unknown.
		
		If this property is not present the client only supports
		the completion items kinds from `Text` to `Reference` as defined in
		the initial version of the protocol.
	**/
	var valueSet : Null<Array<nvim.type.lsp.CompletionItemKind>>;
}