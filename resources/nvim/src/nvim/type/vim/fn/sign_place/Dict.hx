package nvim.type.vim.fn.sign_place;

/**
	```lua
	(class) vim.fn.sign_place.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_place.dict.lnum: (string|integer)?
		```
	**/
	@:optional
	extern public var lnum : Null<haxe.extern.EitherType<Float, String>>;
	/**
		```lua
		(field) vim.fn.sign_place.dict.priority: integer?
		```
	**/
	@:optional
	extern public var priority : Null<Float>;
}