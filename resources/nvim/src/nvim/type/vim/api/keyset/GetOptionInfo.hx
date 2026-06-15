package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_option_info
	```
**/
@:structInit extern class GetOptionInfo {
	/**
		```lua
		(field) vim.api.keyset.get_option_info.allows_duplicates: boolean
		```
	**/
	var allows_duplicates : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.commalist: boolean
		```
	**/
	var commalist : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.default: boolean|string|integer
		```
	**/
	@:native("default")
	var default_ : haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, Int>>;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.flaglist: boolean
		```
	**/
	var flaglist : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.global_local: boolean
		```
	**/
	var global_local : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_chan: integer
		```
	**/
	var last_set_chan : Int;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_linenr: integer
		```
	**/
	var last_set_linenr : Int;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_sid: integer
		```
	**/
	var last_set_sid : Int;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.scope: 'buf'|'global'|'win'
		```
	**/
	var scope : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.shortname: string
		```
	**/
	var shortname : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.type: 'boolean'|'number'|'string'
		```
	**/
	var type : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.was_set: boolean
		```
	**/
	var was_set : Bool;
}