package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_highlight
	```
**/
@:structInit class GetHighlight {
	/**
		```lua
		(field) vim.api.keyset.get_highlight.create: boolean?
		```
	**/
	@:optional
	extern public var create : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.id: integer?
		```
	**/
	@:optional
	extern public var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.link: boolean?
		```
	**/
	@:optional
	extern public var link : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.name: string?
		```
	**/
	@:optional
	extern public var name : Null<String>;
}