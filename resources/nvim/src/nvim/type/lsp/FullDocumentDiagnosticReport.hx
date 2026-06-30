package nvim.type.lsp;

/**
	```lua
	(class) lsp.FullDocumentDiagnosticReport
	```
	
	---
	
	A diagnostic report with a full set of problems.
	
**/
@:structInit class FullDocumentDiagnosticReport {
	/**
		```lua
		(field) lsp.FullDocumentDiagnosticReport.items: lsp.Diagnostic[]
		```
		
		---
		
		
		The actual items.
	**/
	extern public var items : lua.Table<Int, nvim.type.lsp.Diagnostic>;
	/**
		```lua
		(field) lsp.FullDocumentDiagnosticReport.kind: "full"
		```
		
		---
		
		
		A full document diagnostic report.
	**/
	extern public var kind : String;
	/**
		```lua
		(field) lsp.FullDocumentDiagnosticReport.resultId: string?
		```
		
		---
		
		
		An optional result id. If provided it will
		be sent on the next diagnostic request for the
		same document.
	**/
	@:optional
	extern public var resultId : Null<String>;
}