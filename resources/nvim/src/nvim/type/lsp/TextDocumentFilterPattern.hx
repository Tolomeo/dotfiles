package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentFilterPattern
	```
	
	---
	
	A document filter where `pattern` is required field.
	
**/
@:structInit class TextDocumentFilterPattern {
	/**
		```lua
		(field) lsp.TextDocumentFilterPattern.language: string?
		```
		
		---
		
		
		A language id, like `typescript`.
	**/
	@:optional
	extern public var language : Null<String>;
	/**
		```lua
		(field) lsp.TextDocumentFilterPattern.pattern: string|lsp.RelativePattern
		```
		
		---
		
		The glob pattern. Either a string pattern or a relative pattern.
		
		
		---
		
		
		A glob pattern, like **\/*.{ts,js}. See TextDocumentFilter for examples.
		
		relative patterns depends on the client capability
		`textDocuments.filters.relativePatternSupport`.
		
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
	extern public var pattern : nvim.type.lsp.GlobPattern;
	/**
		```lua
		(field) lsp.TextDocumentFilterPattern.scheme: string?
		```
		
		---
		
		
		A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
	**/
	@:optional
	extern public var scheme : Null<String>;
}