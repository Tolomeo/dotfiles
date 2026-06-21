package nvim.type.lsp;

/**
	```lua
	(class) lsp.RelatedFullDocumentDiagnosticReport
	```
	
	---
	
	A full diagnostic report with a set of related documents.
	
**/
@:structInit class RelatedFullDocumentDiagnosticReport {
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.items: lsp.Diagnostic[]
		```
		
		---
		
		
		The actual items.
	**/
	extern var items : Array<nvim.type.lsp.Diagnostic>;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.kind: "full"
		```
		
		---
		
		
		A full document diagnostic report.
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.relatedDocuments: table<string, lsp.FullDocumentDiagnosticReport|lsp.UnchangedDocumentDiagnosticReport>?
		```
		
		---
		
		
		Diagnostics of related documents. This information is useful
		in programming languages where code in a file A can generate
		diagnostics in a file B which A depends on. An example of
		such a language is C/C++ where marco definitions in a file
		a.cpp and result in errors in a header file b.hpp.
		
	**/
	@:optional
	extern var relatedDocuments : Null<lua.Table<nvim.type.lsp.DocumentUri, haxe.extern.EitherType<nvim.type.lsp.FullDocumentDiagnosticReport, nvim.type.lsp.UnchangedDocumentDiagnosticReport>>>;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.resultId: string?
		```
		
		---
		
		
		An optional result id. If provided it will
		be sent on the next diagnostic request for the
		same document.
	**/
	@:optional
	extern var resultId : Null<String>;
}