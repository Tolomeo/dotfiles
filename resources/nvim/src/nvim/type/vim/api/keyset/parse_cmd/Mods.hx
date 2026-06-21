package nvim.type.vim.api.keyset.parse_cmd;

/**
	```lua
	(field) vim.api.keyset.parse_cmd.mods.filter: { force: boolean, pattern: string }
	```
**/
@:structInit class Filter {
	extern var force : Bool;
	extern var pattern : String;
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
	extern var browse : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.confirm: boolean
		```
	**/
	extern var confirm : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.emsg_silent: boolean
		```
	**/
	extern var emsg_silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.hide: boolean
		```
	**/
	extern var hide : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.horizontal: boolean
		```
	**/
	extern var horizontal : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepalt: boolean
		```
	**/
	extern var keepalt : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepjumps: boolean
		```
	**/
	extern var keepjumps : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keepmarks: boolean
		```
	**/
	extern var keepmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.keeppatterns: boolean
		```
	**/
	extern var keeppatterns : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.lockmarks: boolean
		```
	**/
	extern var lockmarks : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noautocmd: boolean
		```
	**/
	extern var noautocmd : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.noswapfile: boolean
		```
	**/
	extern var noswapfile : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.sandbox: boolean
		```
	**/
	extern var sandbox : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.silent: boolean
		```
	**/
	extern var silent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.split: ''|'aboveleft'|'belowright'|'botright'|'topleft'
		```
	**/
	extern var split : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.tab: integer
		```
	**/
	extern var tab : Int;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.unsilent: boolean
		```
	**/
	extern var unsilent : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.verbose: integer
		```
	**/
	extern var verbose : Int;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods.vertical: boolean
		```
	**/
	extern var vertical : Bool;
}