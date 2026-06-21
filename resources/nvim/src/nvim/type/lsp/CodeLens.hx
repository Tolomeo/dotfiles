package nvim.type.lsp;

/**
	```lua
	(class) lsp.CodeLens
	```
	
	---
	
	A code lens represents a {@link Command command} that should be shown along with
	source text, like the number of references, a way to run tests, etc.
	
	A code lens is _unresolved_ when no command is associated to it. For performance
	reasons the creation of a code lens and resolving should be done in two stages.
**/
@:structInit class CodeLens {
	/**
		```lua
		(field) lsp.CodeLens.command: (lsp.Command)?
		```
		
		---
		
		Represents a reference to a command. Provides a title which
		will be used to represent a command in the UI and, optionally,
		an array of arguments which will be passed to the command handler
		function when invoked.
		
		---
		
		
		The command this code lens represents.
	**/
	@:optional
	extern var command : Null<nvim.type.lsp.Command>;
	/**
		```lua
		(field) lsp.CodeLens.data: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		A data entry field that is preserved on a code lens item between
		a {@link CodeLensRequest} and a {@link CodeLensResolveRequest}
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	@:optional
	extern var data : Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(field) lsp.CodeLens.range: lsp.Range
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
		
		
		The range in which this code lens is valid. Should only span a single line.
	**/
	extern var range : nvim.type.lsp.Range;
}