package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_config
	```
**/
@:structInit class WinConfig {
	/**
		```lua
		(field) vim.api.keyset.win_config.anchor: ('NE'|'NW'|'SE'|'SW')?
		```
	**/
	@:optional
	extern public var anchor : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.border: ('double'|'none'|'rounded'|'shadow'|'single'|'solid'|string[])?
		```
	**/
	@:optional
	extern public var border : Null<haxe.extern.EitherType<String, lua.Table<Int, String>>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.bufpos: integer[]?
		```
	**/
	@:optional
	extern public var bufpos : Null<lua.Table<Int, Int>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.col: number?
		```
	**/
	@:optional
	extern public var col : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.external: boolean?
		```
	**/
	@:optional
	extern public var external : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.fixed: boolean?
		```
	**/
	@:optional
	extern public var fixed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.focusable: boolean?
		```
	**/
	@:optional
	extern public var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer: any
		```
	**/
	@:optional
	extern public var footer : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	extern public var footer_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.height: integer?
		```
	**/
	@:optional
	extern public var height : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.hide: boolean?
		```
	**/
	@:optional
	extern public var hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.mouse: boolean?
		```
	**/
	@:optional
	extern public var mouse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.noautocmd: boolean?
		```
	**/
	@:optional
	extern public var noautocmd : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.relative: ('cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win')?
		```
	**/
	@:optional
	extern public var relative : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.row: number?
		```
	**/
	@:optional
	extern public var row : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.split: ('above'|'below'|'left'|'right')?
		```
	**/
	@:optional
	extern public var split : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.style: 'minimal'?
		```
	**/
	@:optional
	extern public var style : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title: any
		```
	**/
	@:optional
	extern public var title : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	extern public var title_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.vertical: boolean?
		```
	**/
	@:optional
	extern public var vertical : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.width: integer?
		```
	**/
	@:optional
	extern public var width : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.win: integer?
		```
	**/
	@:optional
	extern public var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.zindex: integer?
		```
	**/
	@:optional
	extern public var zindex : Null<Int>;
}