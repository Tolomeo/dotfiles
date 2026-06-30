package nvim.type.lsp;

/**
	```lua
	(class) lsp.StringValue
	```
	
	---
	
	A string value used as a snippet is a template which allows to insert text
	and to control the editor cursor when insertion happens.
	
	A snippet can define tab stops and placeholders with `$1`, `$2`
	and `${3:foo}`. `$0` defines the final tab stop, it defaults to
	the end of the snippet. Variables are defined with `$name` and
	`${name:default value}`.
	
**/
@:structInit class StringValue {
	/**
		```lua
		(field) lsp.StringValue.kind: "snippet"
		```
		
		---
		
		
		The kind of string value.
	**/
	extern public var kind : String;
	/**
		```lua
		(field) lsp.StringValue.value: string
		```
		
		---
		
		
		The snippet string.
	**/
	extern public var value : String;
}