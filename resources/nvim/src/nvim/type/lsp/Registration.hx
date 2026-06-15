package nvim.type.lsp;

/**
	```lua
	(class) lsp.Registration
	```
	
	---
	
	General parameters to register for a notification or to register a provider.
**/
@:structInit extern class Registration {
	/**
		```lua
		(field) lsp.Registration.id: string
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again.
	**/
	var id : String;
	/**
		```lua
		(field) lsp.Registration.method: string
		```
		
		---
		
		
		The method / capability to register for.
	**/
	var method : String;
	/**
		```lua
		(field) lsp.Registration.registerOptions: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		Options necessary for the registration.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	var registerOptions : Null<nvim.type.lsp.LSPAny>;
}