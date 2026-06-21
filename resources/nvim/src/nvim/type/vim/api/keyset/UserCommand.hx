package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.user_command
	```
**/
@:structInit class UserCommand {
	/**
		```lua
		(field) vim.api.keyset.user_command.addr: any
		```
	**/
	@:optional
	extern var addr : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bang: boolean?
		```
	**/
	@:optional
	extern var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bar: boolean?
		```
	**/
	@:optional
	extern var bar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.complete: any
		```
	**/
	@:optional
	extern var complete : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.count: any
		```
	**/
	@:optional
	extern var count : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.desc: any
		```
	**/
	@:optional
	extern var desc : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.force: boolean?
		```
	**/
	@:optional
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.keepscript: boolean?
		```
	**/
	@:optional
	extern var keepscript : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.nargs: any
		```
	**/
	@:optional
	extern var nargs : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.preview: any
		```
	**/
	@:optional
	extern var preview : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.range: any
		```
	**/
	@:optional
	extern var range : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.register: boolean?
		```
	**/
	@:optional
	extern var register : Null<Bool>;
}