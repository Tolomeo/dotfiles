package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentSymbol
	```
	
	---
	
	Represents programming constructs like variables, classes, interfaces etc.
	that appear in a document. Document symbols can be hierarchical and they
	have two ranges: one that encloses its definition and one that points to
	its most interesting range, e.g. the range of an identifier.
**/
@:structInit class DocumentSymbol {
	/**
		```lua
		(field) lsp.DocumentSymbol.children: lsp.DocumentSymbol[]?
		```
		
		---
		
		
		Children of this symbol, e.g. properties of a class.
	**/
	@:optional
	extern public var children : Null<lua.Table<Int, nvim.type.lsp.DocumentSymbol>>;
	/**
		```lua
		(field) lsp.DocumentSymbol.deprecated: boolean?
		```
		
		---
		
		
		Indicates if this symbol is deprecated.
		
	**/
	@:optional
	extern public var deprecated : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbol.detail: string?
		```
		
		---
		
		
		More detail for this symbol, e.g the signature of a function.
	**/
	@:optional
	extern public var detail : Null<String>;
	/**
		```lua
		(field) lsp.DocumentSymbol.kind: 1|10|11|12|13|14|15|16|17|18|19|2|20|21|22|23|24|25|26|3|4|5|6|7|8|9
		```
		
		---
		
		A symbol kind.
		
		---
		
		
		The kind of this symbol.
		
		---
		
		```lua
		-- A symbol kind.
		lsp.SymbolKind:
		    | 1 -- File
		    | 2 -- Module
		    | 3 -- Namespace
		    | 4 -- Package
		    | 5 -- Class
		    | 6 -- Method
		    | 7 -- Property
		    | 8 -- Field
		    | 9 -- Constructor
		    | 10 -- Enum
		    | 11 -- Interface
		    | 12 -- Function
		    | 13 -- Variable
		    | 14 -- Constant
		    | 15 -- String
		    | 16 -- Number
		    | 17 -- Boolean
		    | 18 -- Array
		    | 19 -- Object
		    | 20 -- Key
		    | 21 -- Null
		    | 22 -- EnumMember
		    | 23 -- Struct
		    | 24 -- Event
		    | 25 -- Operator
		    | 26 -- TypeParameter
		```
	**/
	extern public var kind : nvim.type.lsp.SymbolKind;
	/**
		```lua
		(field) lsp.DocumentSymbol.name: string
		```
		
		---
		
		
		The name of this symbol. Will be displayed in the user interface and therefore must not be
		an empty string or a string only consisting of white spaces.
	**/
	extern public var name : String;
	/**
		```lua
		(field) lsp.DocumentSymbol.range: lsp.Range
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
		
		
		The range enclosing this symbol not including leading/trailing whitespace but everything else
		like comments. This information is typically used to determine if the clients cursor is
		inside the symbol to reveal in the symbol in the UI.
	**/
	extern public var range : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.DocumentSymbol.selectionRange: lsp.Range
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
		
		
		The range that should be selected and revealed when this symbol is being picked, e.g the name of a function.
		Must be contained by the `range`.
	**/
	extern public var selectionRange : nvim.type.lsp.Range;
	/**
		```lua
		(field) lsp.DocumentSymbol.tags: 1[]?
		```
		
		---
		
		
		Tags for this document symbol.
		
	**/
	@:optional
	extern public var tags : Null<lua.Table<Int, nvim.type.lsp.SymbolTag>>;
}