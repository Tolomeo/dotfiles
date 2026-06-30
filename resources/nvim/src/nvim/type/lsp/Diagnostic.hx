package nvim.type.lsp;

/**
	```lua
	(class) lsp.Diagnostic
	```
	
	---
	
	Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
	are only valid in the scope of a resource.
**/
@:structInit class Diagnostic {
	/**
		```lua
		(field) lsp.Diagnostic.code: (string|integer)?
		```
		
		---
		
		
		The diagnostic's code, which usually appear in the user interface.
	**/
	@:optional
	extern public var code : Null<haxe.extern.EitherType<Float, String>>;
	/**
		```lua
		(field) lsp.Diagnostic.codeDescription: (lsp.CodeDescription)?
		```
		
		---
		
		Structure to capture a description for an error code.
		
		
		---
		
		
		An optional property to describe the error code.
		Requires the code field (above) to be present/not null.
		
	**/
	@:optional
	extern public var codeDescription : Null<nvim.type.lsp.CodeDescription>;
	/**
		```lua
		(field) lsp.Diagnostic.data: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		A data entry field that is preserved between a `textDocument/publishDiagnostics`
		notification and `textDocument/codeAction` request.
		
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	@:optional
	extern public var data : Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(field) lsp.Diagnostic.message: string
		```
		
		---
		
		
		The diagnostic's message. It usually appears in the user interface
	**/
	extern public var message : String;
	/**
		```lua
		(field) lsp.Diagnostic.range: lsp.Range
		```
		
		---
		
		A range in a text document expressed as (zero-based) start and end positions.
		
		If you want to specify a range that contains a line including the line ending
		character(s) then use an end position denoting the start of the next line.
		For example:
		```ts
		{
		    start: { line: 5, character: 23 }
		    end : { line 6, character : 0 }
		}
		```
		
		---
		
		
		The range at which the message applies
	**/
	extern public var range : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.Diagnostic.relatedInformation: lsp.DiagnosticRelatedInformation[]?
		```
		
		---
		
		
		An array of related diagnostic information, e.g. when symbol-names within
		a scope collide all definitions can be marked via this property.
	**/
	@:optional
	extern public var relatedInformation : Null<lua.Table<Int, nvim.type.lsp.DiagnosticRelatedInformation>>;
	/**
		```lua
		(field) lsp.Diagnostic.severity: (1|2|3|4)?
		```
		
		---
		
		The diagnostic's severity.
		
		---
		
		
		The diagnostic's severity. To avoid interpretation mismatches when a
		server is used with different clients it is highly recommended that servers
		always provide a severity value.
		
		---
		
		```lua
		-- The diagnostic's severity.
		lsp.DiagnosticSeverity:
		    | 1 -- Error
		    | 2 -- Warning
		    | 3 -- Information
		    | 4 -- Hint
		```
	**/
	@:optional
	extern public var severity : Null<nvim.type.lsp.DiagnosticSeverity>;
	/**
		```lua
		(field) lsp.Diagnostic.source: string?
		```
		
		---
		
		
		A human-readable string describing the source of this
		diagnostic, e.g. 'typescript' or 'super lint'. It usually
		appears in the user interface.
	**/
	@:optional
	extern public var source : Null<String>;
	/**
		```lua
		(field) lsp.Diagnostic.tags: 1|2[]?
		```
		
		---
		
		
		Additional metadata about the diagnostic.
		
	**/
	@:optional
	extern public var tags : Null<lua.Table<Int, nvim.type.lsp.DiagnosticTag>>;
}