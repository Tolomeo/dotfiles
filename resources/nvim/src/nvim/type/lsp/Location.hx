package nvim.type.lsp;

/**
	```lua
	(class) lsp.Location
	```
	
	---
	
	Represents a location inside a resource, such as a line
	inside a text file.
**/
@:structInit class Location {
	/**
		```lua
		(field) lsp.Location.range: lsp.Range
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
	**/
	extern public var range : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.Location.uri: string
		```
	**/
	extern public var uri : nvim.type.lsp.DocumentUri;
}