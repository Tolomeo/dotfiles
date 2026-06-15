package nvim.type.vim.api.keyset.parse_cmd;

/**
	```lua
	(field) vim.api.keyset.parse_cmd.mods.filter: { force: boolean, pattern: string }
	```
**/
@:structInit extern class Filter {
	var force : Bool;
	var pattern : String;
}

/**
	```lua
	(class) vim.api.keyset.parse_cmd.mods
	```
**/
@:structInit extern class Mods {
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.browse: boolean
		```
	**/
	var browse : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.confirm: boolean
		```
	**/
	var confirm : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.emsg_silent: boolean
		```
	**/
	var emsg_silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.hide: boolean
		```
	**/
	var hide : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.horizontal: boolean
		```
	**/
	var horizontal : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepalt: boolean
		```
	**/
	var keepalt : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepjumps: boolean
		```
	**/
	var keepjumps : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepmarks: boolean
		```
	**/
	var keepmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keeppatterns: boolean
		```
	**/
	var keeppatterns : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.lockmarks: boolean
		```
	**/
	var lockmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noautocmd: boolean
		```
	**/
	var noautocmd : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noswapfile: boolean
		```
	**/
	var noswapfile : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.sandbox: boolean
		```
	**/
	var sandbox : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.silent: boolean
		```
	**/
	var silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.split: ''|'aboveleft'|'belowright'|'botright'|'topleft'
		```
	**/
	var split : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.tab: integer
		```
	**/
	var tab : Int;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.unsilent: boolean
		```
	**/
	var unsilent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.verbose: integer
		```
	**/
	var verbose : Int;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.vertical: boolean
		```
	**/
	var vertical : Bool;
}