package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSymbolKindOptions
	```
**/
@:structInit class ClientSymbolKindOptions {
	/**
		```lua
		(field) lsp.ClientSymbolKindOptions.valueSet: 1|10|11|12|13|14|15|16|17|18|19|2|20|21|22|23|24|25|26|3|4|5|6|7|8|9[]?
		```
		
		---
		
		
		The symbol kind values the client supports. When this
		property exists the client also guarantees that it will
		handle values outside its set gracefully and falls back
		to a default value when unknown.
		
		If this property is not present the client only supports
		the symbol kinds from `File` to `Array` as defined in
		the initial version of the protocol.
	**/
	@:optional
	extern var valueSet : Null<Array<nvim.type.lsp.SymbolKind>>;
}