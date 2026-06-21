package nvim.type.lsp;

/**
	```lua
	(class) lsp.FormattingOptions
	```
	
	---
	
	Value-object describing what options formatting should use.
**/
@:structInit class FormattingOptions {
	/**
		```lua
		(field) lsp.FormattingOptions.insertFinalNewline: boolean?
		```
		
		---
		
		
		Insert a newline character at the end of the file if one does not exist.
		
	**/
	@:optional
	extern var insertFinalNewline : Null<Bool>;
	/**
		```lua
		(field) lsp.FormattingOptions.insertSpaces: boolean
		```
		
		---
		
		
		Prefer spaces over tabs.
	**/
	extern var insertSpaces : Bool;
	/**
		```lua
		(field) lsp.FormattingOptions.tabSize: integer
		```
		
		---
		
		
		Size of a tab in spaces.
	**/
	extern var tabSize : nvim.type.Uinteger;
	/**
		```lua
		(field) lsp.FormattingOptions.trimFinalNewlines: boolean?
		```
		
		---
		
		
		Trim all newlines after the final newline at the end of the file.
		
	**/
	@:optional
	extern var trimFinalNewlines : Null<Bool>;
	/**
		```lua
		(field) lsp.FormattingOptions.trimTrailingWhitespace: boolean?
		```
		
		---
		
		
		Trim trailing whitespace on a line.
		
	**/
	@:optional
	extern var trimTrailingWhitespace : Null<Bool>;
}