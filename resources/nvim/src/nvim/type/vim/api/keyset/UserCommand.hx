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
	extern public var addr : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bang: boolean?
		```
	**/
	@:optional
	extern public var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bar: boolean?
		```
	**/
	@:optional
	extern public var bar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.complete: any
		```
	**/
	@:optional
	extern public var complete : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.count: any
		```
	**/
	@:optional
	extern public var count : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.desc: any
		```
	**/
	@:optional
	extern public var desc : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.force: boolean?
		```
	**/
	@:optional
	extern public var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.keepscript: boolean?
		```
	**/
	@:optional
	extern public var keepscript : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.nargs: any
		```
	**/
	@:optional
	extern public var nargs : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.preview: any
		```
	**/
	@:optional
	extern public var preview : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.range: any
		```
	**/
	@:optional
	extern public var range : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.register: boolean?
		```
	**/
	@:optional
	extern public var register : Null<Bool>;
}