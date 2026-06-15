package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSemanticTokensRequestFullDelta
	```
**/
@:structInit extern class ClientSemanticTokensRequestFullDelta {
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestFullDelta.delta: boolean?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/full/delta` request if
		the server provides a corresponding handler.
	**/
	var delta : Null<Bool>;
}