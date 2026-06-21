package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_hl_info
	```
**/
@:structInit class GetHlInfo {
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.altfont: true?
		```
	**/
	@:optional
	extern var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bg: integer?
		```
	**/
	@:optional
	extern var bg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.blend: integer?
		```
	**/
	@:optional
	extern var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bold: true?
		```
	**/
	@:optional
	extern var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.cterm: (vim.api.keyset.hl_info.cterm)?
		```
	**/
	@:optional
	extern var cterm : Null<nvim.type.vim.api.keyset.hl_info.Cterm>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermbg: integer?
		```
	**/
	@:optional
	extern var ctermbg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermfg: integer?
		```
	**/
	@:optional
	extern var ctermfg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.default: true?
		```
	**/
	@:optional
	@:native("default")
	extern var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.fg: integer?
		```
	**/
	@:optional
	extern var fg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.italic: true?
		```
	**/
	@:optional
	extern var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.link: string?
		```
	**/
	@:optional
	extern var link : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.nocombine: true?
		```
	**/
	@:optional
	extern var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.reverse: true?
		```
	**/
	@:optional
	extern var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.sp: integer?
		```
	**/
	@:optional
	extern var sp : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.standout: true?
		```
	**/
	@:optional
	extern var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.strikethrough: true?
		```
	**/
	@:optional
	extern var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.undercurl: true?
		```
	**/
	@:optional
	extern var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdashed: true?
		```
	**/
	@:optional
	extern var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdotted: true?
		```
	**/
	@:optional
	extern var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdouble: true?
		```
	**/
	@:optional
	extern var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underline: true?
		```
	**/
	@:optional
	extern var underline : Null<Bool>;
}