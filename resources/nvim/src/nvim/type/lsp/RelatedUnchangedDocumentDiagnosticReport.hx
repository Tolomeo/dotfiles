package nvim.type.lsp;

/**
	```lua
	(class) lsp.RelatedUnchangedDocumentDiagnosticReport
	```
	
	---
	
	An unchanged diagnostic report with a set of related documents.
	
**/
@:structInit class RelatedUnchangedDocumentDiagnosticReport {
	/**
		```lua
		(field) lsp.RelatedUnchangedDocumentDiagnosticReport.kind: "unchanged"
		```
		
		---
		
		
		A document diagnostic report indicating
		no changes to the last result. A server can
		only return `unchanged` if result ids are
		provided.
	**/
	extern public var kind : String;
	/**
		```lua
		(field) lsp.RelatedUnchangedDocumentDiagnosticReport.relatedDocuments: table<string, lsp.FullDocumentDiagnosticReport|lsp.UnchangedDocumentDiagnosticReport>?
		```
		
		---
		
		
		Diagnostics of related documents. This information is useful
		in programming languages where code in a file A can generate
		diagnostics in a file B which A depends on. An example of
		such a language is C/C++ where marco definitions in a file
		a.cpp and result in errors in a header file b.hpp.
		
	**/
	@:optional
	extern public var relatedDocuments : Null<lua.Table<nvim.type.lsp.DocumentUri, haxe.extern.EitherType<nvim.type.lsp.FullDocumentDiagnosticReport, nvim.type.lsp.UnchangedDocumentDiagnosticReport>>>;
	/**
		```lua
		(field) lsp.RelatedUnchangedDocumentDiagnosticReport.resultId: string
		```
		
		---
		
		
		A result id which will be sent on the next
		diagnostic request for the same document.
	**/
	extern public var resultId : String;
}