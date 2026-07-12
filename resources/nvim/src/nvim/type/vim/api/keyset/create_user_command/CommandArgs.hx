package nvim.type.vim.api.keyset.create_user_command;

/**
	```lua
	(class) vim.api.keyset.create_user_command.command_args
	```
**/
@:structInit class CommandArgs {
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.args: string
		```
		
		---
		
		
		 The args passed to the command, if any <args>
	**/
	extern public var args : String;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.bang: boolean
		```
		
		---
		
		
		 "true" if the command was executed with a ! modifier <bang>
	**/
	extern public var bang : Bool;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.count: integer
		```
		
		---
		
		
		 Any count supplied <count>
	**/
	extern public var count : Int;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.fargs: string[]
		```
		
		---
		
		
		 The args split by unescaped whitespace
		 (when more than one argument is allowed), if any <f-args>
	**/
	extern public var fargs : lua.Table<Int, String>;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.line1: integer
		```
		
		---
		
		
		 The starting line of the command range <line1>
	**/
	extern public var line1 : Int;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.line2: integer
		```
		
		---
		
		
		 The final line of the command range <line2>
	**/
	extern public var line2 : Int;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.mods: string
		```
		
		---
		
		 Command modifiers, if any <mods>
	**/
	extern public var mods : String;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.name: string
		```
		
		---
		
		Command name
	**/
	extern public var name : String;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.nargs: string
		```
		
		---
		
		
		 Number of arguments |:command-nargs|
	**/
	extern public var nargs : String;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.range: integer
		```
		
		---
		
		
		 The number of items in the command range: 0, 1, or 2 <range>
	**/
	extern public var range : Int;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.reg: string
		```
		
		---
		
		 The optional register, if specified <reg>
	**/
	extern public var reg : String;
	/**
		```lua
		(field) vim.api.keyset.create_user_command.command_args.smods: table
		```
		
		---
		
		
		 Command modifiers in a structured format. Has the same structure as the
		 "mods" key of |nvim_parse_cmd()|.
	**/
	extern public var smods : lua.Table.AnyTable;
}