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
	extern var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.background: (string|integer)?
		```
	**/
	@:optional
	extern var background : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg: (string|integer)?
		```
	**/
	@:optional
	extern var bg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg_indexed: boolean?
		```
	**/
	@:optional
	extern var bg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.blend: integer?
		```
	**/
	@:optional
	extern var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bold: boolean?
		```
	**/
	@:optional
	extern var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.cterm: (string|integer)?
		```
	**/
	@:optional
	extern var cterm : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermbg: (string|integer)?
		```
	**/
	@:optional
	extern var ctermbg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermfg: (string|integer)?
		```
	**/
	@:optional
	extern var ctermfg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.default: boolean?
		```
	**/
	@:optional
	@:native("default")
	extern var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fallback: boolean?
		```
	**/
	@:optional
	extern var fallback : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg: (string|integer)?
		```
	**/
	@:optional
	extern var fg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg_indexed: boolean?
		```
	**/
	@:optional
	extern var fg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.force: boolean?
		```
	**/
	@:optional
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.foreground: (string|integer)?
		```
	**/
	@:optional
	extern var foreground : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.global_link: (string|integer)?
		```
	**/
	@:optional
	extern var global_link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.italic: boolean?
		```
	**/
	@:optional
	extern var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.link: (string|integer)?
		```
	**/
	@:optional
	extern var link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.nocombine: boolean?
		```
	**/
	@:optional
	extern var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.reverse: boolean?
		```
	**/
	@:optional
	extern var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.sp: (string|integer)?
		```
	**/
	@:optional
	extern var sp : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.special: (string|integer)?
		```
	**/
	@:optional
	extern var special : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.standout: boolean?
		```
	**/
	@:optional
	extern var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.strikethrough: boolean?
		```
	**/
	@:optional
	extern var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.undercurl: boolean?
		```
	**/
	@:optional
	extern var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdashed: boolean?
		```
	**/
	@:optional
	extern var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdotted: boolean?
		```
	**/
	@:optional
	extern var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdouble: boolean?
		```
	**/
	@:optional
	extern var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underline: boolean?
		```
	**/
	@:optional
	extern var underline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.url: string?
		```
	**/
	@:optional
	extern var url : Null<String>;
}