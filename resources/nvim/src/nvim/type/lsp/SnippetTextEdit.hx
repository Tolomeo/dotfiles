package nvim.type.lsp;

/**
	```lua
	(class) lsp.SnippetTextEdit
	```
	
	---
	
	An interactive text edit.
	
**/
@:structInit class SnippetTextEdit {
	/**
		```lua
		(field) lsp.SnippetTextEdit.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		The actual identifier of the snippet edit.
	**/
	@:optional
	extern var annotationId : Null<nvim.type.lsp.ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.SnippetTextEdit.range: lsp.Range
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
		
		
		The range of the text document to be manipulated.
	**/
	extern var range : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.SnippetTextEdit.snippet: lsp.StringValue
		```
		
		---
		
		A string value used as a snippet is a template which allows to insert text
		and to control the editor cursor when insertion happens.
		
		A snippet can define tab stops and placeholders with `$1`, `$2`
		and `${3:foo}`. `$0` defines the final tab stop, it defaults to
		the end of the snippet. Variables are defined with `$name` and
		`${name:default value}`.
		
		
		---
		
		
		The snippet to be inserted.
	**/
	extern var snippet : nvim.type.lsp.StringValue;
}