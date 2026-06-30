package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSemanticTokensRequestFullDelta
	```
**/
@:structInit class ClientSemanticTokensRequestFullDelta {
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestFullDelta.delta: boolean?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/full/delta` request if
		the server provides a corresponding handler.
	**/
	@:optional
	extern public var delta : Null<Bool>;
}