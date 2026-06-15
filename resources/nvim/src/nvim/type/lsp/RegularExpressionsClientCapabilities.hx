package nvim.type.lsp;

/**
	```lua
	(class) lsp.RegularExpressionsClientCapabilities
	```
	
	---
	
	Client capabilities specific to regular expressions.
	
**/
@:structInit extern class RegularExpressionsClientCapabilities {
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.engine: string
		```
		
		---
		
		
		The engine's name.
	**/
	var engine : nvim.type.lsp.RegularExpressionEngineKind;
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.version: string?
		```
		
		---
		
		
		The engine's version.
	**/
	var version : Null<String>;
}