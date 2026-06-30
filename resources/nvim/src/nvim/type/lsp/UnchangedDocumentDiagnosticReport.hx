package nvim.type.lsp;

/**
	```lua
	(class) lsp.UnchangedDocumentDiagnosticReport
	```
	
	---
	
	A diagnostic report indicating that the last returned
	report is still accurate.
	
**/
@:structInit class UnchangedDocumentDiagnosticReport {
	/**
		```lua
		(field) lsp.UnchangedDocumentDiagnosticReport.kind: "unchanged"
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
		(field) lsp.UnchangedDocumentDiagnosticReport.resultId: string
		```
		
		---
		
		
		A result id which will be sent on the next
		diagnostic request for the same document.
	**/
	extern public var resultId : String;
}