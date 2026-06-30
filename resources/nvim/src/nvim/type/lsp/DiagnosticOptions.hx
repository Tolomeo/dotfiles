package nvim.type.lsp;

/**
	```lua
	(class) lsp.DiagnosticOptions
	```
	
	---
	
	Diagnostic options.
	
**/
@:structInit class DiagnosticOptions {
	/**
		```lua
		(field) lsp.DiagnosticOptions.identifier: string?
		```
		
		---
		
		
		An optional identifier under which the diagnostics are
		managed by the client.
	**/
	@:optional
	extern public var identifier : Null<String>;
	/**
		```lua
		(field) lsp.DiagnosticOptions.interFileDependencies: boolean
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
		(field) lsp.DiagnosticOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticOptions.workspaceDiagnostics: boolean
		```
		
		---
		
		
		The server provides support for workspace diagnostics as well.
	**/
	extern public var workspaceDiagnostics : Bool;
}