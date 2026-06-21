package nvim.type.lsp;

/**
	```lua
	(class) lsp.SemanticTokensRegistrationOptions
	```
**/
@:structInit class SemanticTokensRegistrationOptions {
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
		```
		
		---
		
		A document selector is the combination of one or many document filters.
		
		\@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
		
		The use of a string as a document filter is deprecated @since 3.16.0.
		
		---
		
		
		A document selector to identify the scope of the registration. If set to null
		the document selector provided on the client side will be used.
	**/
	extern var documentSelector : haxe.extern.EitherType<nvim.type.lsp.DocumentSelector, nvim.type.lsp.Null>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.full: (boolean|lsp.SemanticTokensFullDelta)?
		```
		
		---
		
		Semantic tokens options to support deltas for full documents
		
		
		---
		
		
		Server supports providing semantic tokens for a full document.
	**/
	@:optional
	extern var full : Null<haxe.extern.EitherType<Bool, nvim.type.lsp.SemanticTokensFullDelta>>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	@:optional
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.legend: lsp.SemanticTokensLegend
		```
		
		---
		
		
		The legend used by the server
	**/
	extern var legend : nvim.type.lsp.SemanticTokensLegend;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.range: (boolean|lsp._anonym1.range)?
		```
		
		---
		
		
		Server supports providing semantic tokens for a specific range
		of a document.
	**/
	@:optional
	extern var range : Null<haxe.extern.EitherType<Bool, nvim.type.lsp._anonym1.Range>>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}