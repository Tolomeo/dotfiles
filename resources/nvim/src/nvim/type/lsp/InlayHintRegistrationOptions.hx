package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlayHintRegistrationOptions
	```
	
	---
	
	Inlay hint options used during static or dynamic registration.
	
**/
@:structInit extern class InlayHintRegistrationOptions {
	/**
		```lua
		(field) lsp.InlayHintRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
		```
		
		---
		
		A document selector is the combination of one or many document filters.
		
		\@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
		
		The use of a string as a document filter is deprecated @since 3.16.0.
		
		---
		
		
		A document selector to identify the scope of the registration. If set to null
		the document selector provided on the client side will be used.
	**/
	var documentSelector : haxe.extern.EitherType<nvim.type.lsp.DocumentSelector, nvim.type.lsp.Null>;
	/**
		```lua
		(field) lsp.InlayHintRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	var id : Null<String>;
	/**
		```lua
		(field) lsp.InlayHintRegistrationOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for an inlay hint item.
	**/
	var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}