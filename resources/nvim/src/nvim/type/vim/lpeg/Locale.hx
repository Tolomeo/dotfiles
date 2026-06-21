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
	extern var alnum : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.alpha: userdata
		```
	**/
	extern var alpha : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.cntrl: userdata
		```
	**/
	extern var cntrl : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.digit: userdata
		```
	**/
	extern var digit : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.graph: userdata
		```
	**/
	extern var graph : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.lower: userdata
		```
	**/
	extern var lower : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.print: userdata
		```
	**/
	extern var print : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.punct: userdata
		```
	**/
	extern var punct : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.space: userdata
		```
	**/
	extern var space : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.upper: userdata
		```
	**/
	extern var upper : lua.UserData;
	/**
		```lua
		(field) vim.lpeg.Locale.xdigit: userdata
		```
	**/
	extern var xdigit : lua.UserData;
}