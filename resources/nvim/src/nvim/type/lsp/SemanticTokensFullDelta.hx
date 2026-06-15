package nvim.type.lsp;

/**
	```lua
	(class) lsp.SemanticTokensFullDelta
	```
	
	---
	
	Semantic tokens options to support deltas for full documents
	
**/
@:structInit extern class SemanticTokensFullDelta {
	/**
		```lua
		(field) lsp.SemanticTokensFullDelta.delta: boolean?
		```
		
		---
		
		
		The server supports deltas for full documents.
	**/
	var delta : Null<Bool>;
}