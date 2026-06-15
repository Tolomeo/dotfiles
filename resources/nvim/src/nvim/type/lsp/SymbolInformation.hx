package nvim.type.lsp;

/**
	```lua
	(class) lsp.SymbolInformation
	```
	
	---
	
	Represents information about programming constructs like variables, classes,
	interfaces etc.
**/
@:structInit extern class SymbolInformation {
	/**
		```lua
		(field) lsp.SymbolInformation.containerName: string?
		```
		
		---
		
		
		The name of the symbol containing this symbol. This information is for
		user interface purposes (e.g. to render a qualifier in the user interface
		if necessary). It can't be used to re-infer a hierarchy for the document
		symbols.
	**/
	var containerName : Null<String>;
	/**
		```lua
		(field) lsp.SymbolInformation.deprecated: boolean?
		```
		
		---
		
		
		Indicates if this symbol is deprecated.
		
	**/
	var deprecated : Null<Bool>;
	/**
		```lua
		(field) lsp.SymbolInformation.kind: 1|10|11|12|13|14|15|16|17|18|19|2|20|21|22|23|24|25|26|3|4|5|6|7|8|9
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
	var kind : nvim.type.lsp.SymbolKind;
	/**
		```lua
		(field) lsp.SymbolInformation.location: lsp.Location
		```
		
		---
		
		Represents a location inside a resource, such as a line
		inside a text file.
		
		---
		
		
		The location of this symbol. The location's range is used by a tool
		to reveal the location in the editor. If the symbol is selected in the
		tool the range's start information is used to position the cursor. So
		the range usually spans more than the actual symbol's name and does
		normally include things like visibility modifiers.
		
		The range doesn't have to denote a node range in the sense of an abstract
		syntax tree. It can therefore not be used to re-construct a hierarchy of
		the symbols.
	**/
	var location : nvim.type.lsp.Location;
	/**
		```lua
		(field) lsp.SymbolInformation.name: string
		```
		
		---
		
		
		The name of this symbol.
	**/
	var name : String;
	/**
		```lua
		(field) lsp.SymbolInformation.tags: 1[]?
		```
		
		---
		
		
		Tags for this symbol.
		
	**/
	var tags : Null<Array<nvim.type.lsp.SymbolTag>>;
}