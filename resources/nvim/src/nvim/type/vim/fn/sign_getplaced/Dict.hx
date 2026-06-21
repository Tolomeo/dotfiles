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
	extern var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.id: integer?
		```
	**/
	@:optional
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.lnum: (string|integer)?
		```
	**/
	@:optional
	extern var lnum : Null<haxe.extern.EitherType<String, Int>>;
}