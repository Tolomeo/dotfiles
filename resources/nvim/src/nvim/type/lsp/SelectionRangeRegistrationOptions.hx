package nvim.type.lsp;

/**
	```lua
	(class) lsp.SelectionRangeRegistrationOptions
	```
**/
@:structInit class SelectionRangeRegistrationOptions {
	/**
		```lua
		(field) lsp.SelectionRangeRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
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
		(field) lsp.SelectionRangeRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	@:optional
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.SelectionRangeRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}