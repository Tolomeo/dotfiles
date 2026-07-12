package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.highlight
	```
**/
@:structInit class Highlight {
	/**
		```lua
		(field) vim.api.keyset.highlight.altfont: boolean?
		```
	**/
	@:optional
	extern public var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.background: (string|integer)?
		```
	**/
	@:optional
	extern public var background : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg: (string|integer)?
		```
	**/
	@:optional
	extern public var bg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg_indexed: boolean?
		```
	**/
	@:optional
	extern public var bg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.blend: integer?
		```
	**/
	@:optional
	extern public var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bold: boolean?
		```
	**/
	@:optional
	extern public var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.cterm: (string|integer)?
		```
	**/
	@:optional
	extern public var cterm : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermbg: (string|integer)?
		```
	**/
	@:optional
	extern public var ctermbg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermfg: (string|integer)?
		```
	**/
	@:optional
	extern public var ctermfg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.default: boolean?
		```
	**/
	@:optional
	@:native("default")
	extern public var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fallback: boolean?
		```
	**/
	@:optional
	extern public var fallback : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg: (string|integer)?
		```
	**/
	@:optional
	extern public var fg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg_indexed: boolean?
		```
	**/
	@:optional
	extern public var fg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.force: boolean?
		```
	**/
	@:optional
	extern public var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.foreground: (string|integer)?
		```
	**/
	@:optional
	extern public var foreground : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.global_link: (string|integer)?
		```
	**/
	@:optional
	extern public var global_link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.italic: boolean?
		```
	**/
	@:optional
	extern public var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.link: (string|integer)?
		```
	**/
	@:optional
	extern public var link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.nocombine: boolean?
		```
	**/
	@:optional
	extern public var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.reverse: boolean?
		```
	**/
	@:optional
	extern public var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.sp: (string|integer)?
		```
	**/
	@:optional
	extern public var sp : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.special: (string|integer)?
		```
	**/
	@:optional
	extern public var special : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.standout: boolean?
		```
	**/
	@:optional
	extern public var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.strikethrough: boolean?
		```
	**/
	@:optional
	extern public var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.undercurl: boolean?
		```
	**/
	@:optional
	extern public var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdashed: boolean?
		```
	**/
	@:optional
	extern public var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdotted: boolean?
		```
	**/
	@:optional
	extern public var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdouble: boolean?
		```
	**/
	@:optional
	extern public var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underline: boolean?
		```
	**/
	@:optional
	extern public var underline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.url: string?
		```
	**/
	@:optional
	extern public var url : Null<String>;
}