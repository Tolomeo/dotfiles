package nvim.type.vim.api.keyset;

/**
	```lua
	(field) vim.api.keyset.parse_cmd.magic: { bar: boolean, file: boolean }
	```
**/
@:structInit extern class Magic {
	var bar : Bool;
	var file : Bool;
}

/**
	```lua
	(class) vim.api.keyset.parse_cmd
	```
**/
@:structInit extern class ParseCmd {
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.addr: '?'|'arg'|'buf'|'line'|'load'|'none'|'qf'|'tab'|'win'
		```
	**/
	var addr : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.args: string[]
		```
	**/
	var args : Array<String>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.bang: boolean
		```
	**/
	var bang : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.cmd: string
		```
	**/
	var cmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.count: integer?
		```
	**/
	var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods: vim.api.keyset.parse_cmd.mods
		```
	**/
	var mods : nvim.type.vim.api.keyset.parse_cmd.Mods;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nargs: '*'|'+'|'0'|'1'|'?'
		```
	**/
	var nargs : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nextcmd: string
		```
	**/
	var nextcmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.range: integer[]?
		```
	**/
	var range : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.reg: string?
		```
	**/
	var reg : Null<String>;
}