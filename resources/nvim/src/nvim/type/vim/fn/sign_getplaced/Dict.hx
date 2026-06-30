package nvim.type.vim.fn.sign_getplaced;

/**
	```lua
	(class) vim.fn.sign_getplaced.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.group: string?
		```
	**/
	@:optional
	extern public var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Float>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.lnum: (string|integer)?
		```
	**/
	@:optional
	extern public var lnum : Null<haxe.extern.EitherType<String, Float>>;
}