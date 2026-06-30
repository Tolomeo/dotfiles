package nvim.type.lsp;

/**
	```lua
	(class) lsp.RegularExpressionsClientCapabilities
	```
	
	---
	
	Client capabilities specific to regular expressions.
	
**/
@:structInit class RegularExpressionsClientCapabilities {
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.engine: string
		```
		
		---
		
		
		The engine's name.
	**/
	extern public var engine : nvim.type.lsp.RegularExpressionEngineKind;
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.version: string?
		```
		
		---
		
		
		The engine's version.
	**/
	@:optional
	extern public var version : Null<String>;
}