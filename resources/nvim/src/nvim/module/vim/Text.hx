package nvim.module.vim;

extern class Text {
	@:native("hexdecode")
	@:luaDotMethod
	private function __hexdecode(enc:String):nvim.helper.Multireturn<Null<String>, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		function M.hexdecode(enc: string)
		  -> string?
		  2. string?
		```
		
		---
		
		 Hex decode a string.
		
		@*param* `enc` — String to decode
		
		@*return* — : Decoded string
		
		@*return* — : Error message, if any
	**/
	@:luaDotMethod
	inline function hexdecode(enc:String):nvim.helper.Multireturn.Return2<Null<String>, Null<String>> {
		final result = __hexdecode(enc);
		return new nvim.helper.Multireturn.Return2<Null<String>, Null<String>>(result._0, result._1);
	}
	/**
		```lua
		function M.hexencode(str: string)
		  -> string
		```
		
		---
		
		 Hex encode a string.
		
		@*param* `str` — String to encode
		
		@*return* — : Hex encoded string
	**/
	@:luaDotMethod
	function hexencode(str:String):String;
	@:native("indent")
	@:luaDotMethod
	private function __indent(size:Float, text:String, ?opts:{ @:optional
	var expandtab : Null<Float>; }):nvim.helper.Multireturn<String, Float, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		function M.indent(size: integer, text: string, opts?: { expandtab: number })
		  -> string
		  2. integer
		```
		
		---
		
		 Sets the indent (i.e. the common leading whitespace) of non-empty lines in `text` to `size`
		 spaces/tabs.
		
		 Indent is calculated by number of consecutive indent chars.
		 - The first indented, non-empty line decides the indent char (space/tab):
		   - `SPC SPC TAB …` = two-space indent.
		   - `TAB SPC …` = one-tab indent.
		 - Set `opts.expandtab` to treat tabs as spaces.
		
		 To "dedent" (remove the common indent), pass `size=0`:
		 ```lua
		 vim.print(vim.text.indent(0, ' a\n  b\n'))
		 ```
		
		 To adjust relative-to an existing indent, call indent() twice:
		 ```lua
		 local indented, old_indent = vim.text.indent(0, ' a\n b\n')
		 indented = vim.text.indent(old_indent + 2, indented)
		 vim.print(indented)
		 ```
		
		 To ignore the final, blank line when calculating the indent, use gsub() before calling indent():
		 ```lua
		 local text = '  a\n  b\n '
		 vim.print(vim.text.indent(0, (text:gsub('\n[\t ]+\n?$', '\n'))))
		 ```
		
		@*param* `size` — Number of spaces.
		
		@*param* `text` — Text to indent.
		
		@*return* — Indented text.
		
		@*return* — Indent size _before_ modification.
	**/
	@:luaDotMethod
	inline function indent(size:Float, text:String, ?opts:{ @:optional
	var expandtab : Null<Float>; }):nvim.helper.Multireturn.Return2<String, Float> {
		opts = nvim.helper.Arg.pure(opts);
		final result = __indent(size, text, opts);
		return new nvim.helper.Multireturn.Return2<String, Float>(result._0, result._1);
	}
}