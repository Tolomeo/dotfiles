package nvim.type.vim.api.keyset;

/**
	```lua
	(field) vim.api.keyset.parse_cmd.magic: { bar: boolean, file: boolean }
	```
**/
@:structInit class Magic {
	extern public var bar : Bool;
	extern public var file : Bool;
}

/**
	```lua
	(class) vim.api.keyset.parse_cmd
	```
**/
@:structInit class ParseCmd {
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.addr: '?'|'arg'|'buf'|'line'|'load'|'none'|'qf'|'tab'|'win'
		```
	**/
	extern public var addr : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.args: string[]
		```
	**/
	extern public var args : lua.Table<Int, String>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.bang: boolean
		```
	**/
	extern public var bang : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.cmd: string
		```
	**/
	extern public var cmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.count: integer?
		```
	**/
	@:optional
	extern public var count : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods: vim.api.keyset.parse_cmd.mods
		```
	**/
	extern public var mods : nvim.type.vim.api.keyset.parse_cmd.Mods;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nargs: '*'|'+'|'0'|'1'|'?'
		```
	**/
	extern public var nargs : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nextcmd: string
		```
	**/
	extern public var nextcmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.range: integer[]?
		```
	**/
	@:optional
	extern public var range : Null<lua.Table<Int, Float>>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.reg: string?
		```
	**/
	@:optional
	extern public var reg : Null<String>;
}