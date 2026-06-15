package nvim.type.lsp;

/**
	```lua
	(class) lsp.SemanticTokensLegend
	```
**/
@:structInit extern class SemanticTokensLegend {
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenModifiers: string[]
		```
		
		---
		
		
		The token modifiers a server uses.
	**/
	var tokenModifiers : Array<String>;
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenTypes: string[]
		```
		
		---
		
		
		The token types a server uses.
	**/
	var tokenTypes : Array<String>;
}