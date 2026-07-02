package nvim.type.vim.api.keyset.parse_cmd;

/**
	```lua
	(field) vim.api.keyset.parse_cmd.mods.filter: { force: boolean, pattern: string }
	```
**/
@:structInit class Filter {
	extern public var force : Bool;
	extern public var pattern : String;
}

/**
	```lua
	(class) vim.api.keyset.parse_cmd.mods
	```
**/
@:structInit class Mods {
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.browse: boolean
		```
	**/
	extern public var browse : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.confirm: boolean
		```
	**/
	extern public var confirm : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.emsg_silent: boolean
		```
	**/
	extern public var emsg_silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.filter: { force: boolean, pattern: string }
		```
	**/
	extern public var filter : Filter;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.hide: boolean
		```
	**/
	extern public var hide : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.horizontal: boolean
		```
	**/
	extern public var horizontal : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepalt: boolean
		```
	**/
	extern public var keepalt : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepjumps: boolean
		```
	**/
	extern public var keepjumps : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepmarks: boolean
		```
	**/
	extern public var keepmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keeppatterns: boolean
		```
	**/
	extern public var keeppatterns : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.lockmarks: boolean
		```
	**/
	extern public var lockmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noautocmd: boolean
		```
	**/
	extern public var noautocmd : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noswapfile: boolean
		```
	**/
	extern public var noswapfile : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.sandbox: boolean
		```
	**/
	extern public var sandbox : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.silent: boolean
		```
	**/
	extern public var silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.split: ''|'aboveleft'|'belowright'|'botright'|'topleft'
		```
	**/
	extern public var split : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.tab: integer
		```
	**/
	extern public var tab : Float;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.unsilent: boolean
		```
	**/
	extern public var unsilent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.verbose: integer
		```
	**/
	extern public var verbose : Float;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.vertical: boolean
		```
	**/
	extern public var vertical : Bool;
}