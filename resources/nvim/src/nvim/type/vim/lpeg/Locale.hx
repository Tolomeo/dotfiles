package nvim.type.vim.lpeg;

/**
	```lua
	(class) vim.lpeg.Locale
	```
	
	---
	
	 @nodoc
**/
@:structInit class Locale {
	/**
		```lua
		(field) vim.lpeg.Locale.alnum: userdata
		```
	**/
	extern public var alnum : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.alpha: userdata
		```
	**/
	extern public var alpha : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.cntrl: userdata
		```
	**/
	extern public var cntrl : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.digit: userdata
		```
	**/
	extern public var digit : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.graph: userdata
		```
	**/
	extern public var graph : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.lower: userdata
		```
	**/
	extern public var lower : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.print: userdata
		```
	**/
	extern public var print : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.punct: userdata
		```
	**/
	extern public var punct : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.space: userdata
		```
	**/
	extern public var space : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.upper: userdata
		```
	**/
	extern public var upper : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.xdigit: userdata
		```
	**/
	extern public var xdigit : lua.UserData;
}