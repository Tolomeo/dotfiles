package nvim.type.lsp;

/**
	```lua
	(class) lsp.DiagnosticRelatedInformation
	```
	
	---
	
	Represents a related message and source code location for a diagnostic. This should be
	used to point to code locations that cause or related to a diagnostics, e.g when duplicating
	a symbol in a scope.
**/
@:structInit class DiagnosticRelatedInformation {
	/**
		```lua
		(field) lsp.DiagnosticRelatedInformation.location: lsp.Location
		```
		
		---
		
		Represents a location inside a resource, such as a line
		inside a text file.
		
		---
		
		
		The location of this related diagnostic information.
	**/
	extern var location : nvim.type.lsp.Location;
	/**
		```lua
		(field) lsp.DiagnosticRelatedInformation.message: string
		```
		
		---
		
		
		The message of this related diagnostic information.
	**/
	extern var message : String;
}