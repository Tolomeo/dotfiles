package nvim.type.vim.lpeg;

/**
	```lua
	(class) vim.lpeg.Locale
	```
	
	---
	
	 @nodoc
**/
@:structInit extern class Locale {
	/**
		```lua
		(field) vim.lpeg.Locale.alnum: userdata
		```
	**/
	var alnum : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.alpha: userdata
		```
	**/
	var alpha : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.cntrl: userdata
		```
	**/
	var cntrl : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.digit: userdata
		```
	**/
	var digit : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.graph: userdata
		```
	**/
	var graph : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.lower: userdata
		```
	**/
	var lower : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.print: userdata
		```
	**/
	var print : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.punct: userdata
		```
	**/
	var punct : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.space: userdata
		```
	**/
	var space : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.upper: userdata
		```
	**/
	var upper : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.xdigit: userdata
		```
	**/
	var xdigit : lua.UserData;
}