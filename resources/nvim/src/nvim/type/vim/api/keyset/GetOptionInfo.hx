package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_option_info
	```
**/
@:structInit class GetOptionInfo {
	/**
		```lua
		(field) vim.api.keyset.get_option_info.allows_duplicates: boolean
		```
	**/
	extern public var allows_duplicates : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.commalist: boolean
		```
	**/
	extern public var commalist : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.default: boolean|string|integer
		```
	**/
	@:native("default")
	extern public var default_ : haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, Float>>;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.flaglist: boolean
		```
	**/
	extern public var flaglist : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.global_local: boolean
		```
	**/
	extern public var global_local : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_chan: integer
		```
	**/
	extern public var last_set_chan : Float;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_linenr: integer
		```
	**/
	extern public var last_set_linenr : Float;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.last_set_sid: integer
		```
	**/
	extern public var last_set_sid : Float;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.name: string
		```
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.scope: 'buf'|'global'|'win'
		```
	**/
	extern public var scope : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.shortname: string
		```
	**/
	extern public var shortname : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.type: 'boolean'|'number'|'string'
		```
	**/
	extern public var type : String;
	/**
		```lua
		(field) vim.api.keyset.get_option_info.was_set: boolean
		```
	**/
	extern public var was_set : Bool;
}