package nvim.type.lsp;

/**
	```lua
	(class) lsp.InsertReplaceEdit
	```
	
	---
	
	A special text edit to provide an insert and a replace operation.
	
**/
@:structInit class InsertReplaceEdit {
	/**
		```lua
		(field) lsp.InsertReplaceEdit.insert: lsp.Range
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
		
		
		The range if the insert is requested
	**/
	extern public var insert : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.InsertReplaceEdit.newText: string
		```
		
		---
		
		
		The string to be inserted.
	**/
	extern public var newText : String;
	/**
		```lua
		(field) lsp.InsertReplaceEdit.replace: lsp.Range
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
		
		
		The range if the replace is requested.
	**/
	extern public var replace : nvim.type.lsp.Range;
}