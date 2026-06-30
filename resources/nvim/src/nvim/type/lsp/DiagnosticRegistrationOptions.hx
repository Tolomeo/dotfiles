package nvim.type.lsp;

/**
	```lua
	(class) lsp.DiagnosticRegistrationOptions
	```
	
	---
	
	Diagnostic registration options.
	
**/
@:structInit class DiagnosticRegistrationOptions {
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
		```
		
		---
		
		A document selector is the combination of one or many document filters.
		
		\@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
		
		The use of a string as a document filter is deprecated @since 3.16.0.
		
		---
		
		
		A document selector to identify the scope of the registration. If set to null
		the document selector provided on the client side will be used.
	**/
	extern public var documentSelector : haxe.extern.EitherType<nvim.type.lsp.DocumentSelector, nvim.type.lsp.Null>;
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	@:optional
	extern public var id : Null<String>;
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.identifier: string?
		```
		
		---
		
		
		An optional identifier under which the diagnostics are
		managed by the client.
	**/
	@:optional
	extern public var identifier : Null<String>;
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.interFileDependencies: boolean
		```
		
		---
		
		
		Whether the language has inter file dependencies meaning that
		editing code in one file can result in a different diagnostic
		set in another file. Inter file dependencies are common for
		most programming languages and typically uncommon for linters.
	**/
	extern public var interFileDependencies : Bool;
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticRegistrationOptions.workspaceDiagnostics: boolean
		```
		
		---
		
		
		The server provides support for workspace diagnostics as well.
	**/
	extern public var workspaceDiagnostics : Bool;
}