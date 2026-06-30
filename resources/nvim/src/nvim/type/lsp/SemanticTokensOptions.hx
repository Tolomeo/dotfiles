package nvim.type.lsp;

/**
	```lua
	(class) lsp.SemanticTokensOptions
	```
**/
@:structInit class SemanticTokensOptions {
	/**
		```lua
		(field) lsp.SemanticTokensOptions.full: (boolean|lsp.SemanticTokensFullDelta)?
		```
		
		---
		
		Semantic tokens options to support deltas for full documents
		
		
		---
		
		
		Server supports providing semantic tokens for a full document.
	**/
	@:optional
	extern public var full : Null<haxe.extern.EitherType<Bool, nvim.type.lsp.SemanticTokensFullDelta>>;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.legend: lsp.SemanticTokensLegend
		```
		
		---
		
		
		The legend used by the server
	**/
	extern public var legend : nvim.type.lsp.SemanticTokensLegend;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.range: (boolean|lsp._anonym1.range)?
		```
		
		---
		
		
		Server supports providing semantic tokens for a specific range
		of a document.
	**/
	@:optional
	extern public var range : Null<haxe.extern.EitherType<Bool, nvim.type.lsp._anonym1.Range>>;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}