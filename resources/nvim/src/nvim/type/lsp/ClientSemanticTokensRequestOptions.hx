package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientSemanticTokensRequestOptions
	```
**/
@:structInit class ClientSemanticTokensRequestOptions {
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestOptions.full: (boolean|lsp.ClientSemanticTokensRequestFullDelta)?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/full` request if
		the server provides a corresponding handler.
	**/
	@:optional
	extern var full : Null<haxe.extern.EitherType<Bool, nvim.type.lsp.ClientSemanticTokensRequestFullDelta>>;
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestOptions.range: (boolean|lsp._anonym2.range)?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/range` request if
		the server provides a corresponding handler.
	**/
	@:optional
	extern var range : Null<haxe.extern.EitherType<Bool, nvim.type.lsp._anonym2.Range>>;
}