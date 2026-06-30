package nvim.type.lsp;

/**
	```lua
	(class) lsp.NotebookDocumentFilterScheme
	```
	
	---
	
	A notebook document filter where `scheme` is required field.
	
**/
@:structInit class NotebookDocumentFilterScheme {
	/**
		```lua
		(field) lsp.NotebookDocumentFilterScheme.notebookType: string?
		```
		
		---
		
		
		The type of the enclosing notebook.
	**/
	@:optional
	extern public var notebookType : Null<String>;
	/**
		```lua
		(field) lsp.NotebookDocumentFilterScheme.pattern: (string|lsp.RelativePattern)?
		```
		
		---
		
		The glob pattern. Either a string pattern or a relative pattern.
		
		
		---
		
		
		A glob pattern.
		
		---
		
		The glob pattern to watch relative to the base path. Glob patterns can have the following syntax:
		- `*` to match one or more characters in a path segment
		- `?` to match on one character in a path segment
		- `**` to match any number of path segments, including none
		- `{}` to group conditions (e.g. `**\/*.{ts,js}` matches all TypeScript and JavaScript files)
		- `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
		- `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
		
		
		---
		
		A relative pattern is a helper to construct glob patterns that are matched
		relatively to a base URI. The common value for a `baseUri` is a workspace
		folder root, but it can be another absolute URI as well.
		
	**/
	@:optional
	extern public var pattern : Null<nvim.type.lsp.GlobPattern>;
	/**
		```lua
		(field) lsp.NotebookDocumentFilterScheme.scheme: string
		```
		
		---
		
		
		A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
	**/
	extern public var scheme : String;
}