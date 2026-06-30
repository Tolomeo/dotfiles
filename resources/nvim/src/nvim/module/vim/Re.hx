package nvim.module.vim;

extern class Re {
	/**
		```lua
		function vim.re.compile(string: string, defs?: table)
		  -> vim.lpeg.Pattern
		```
		
		---
		
		 Compiles the given {string} and returns an equivalent LPeg pattern. The given string may define
		 either an expression or a grammar. The optional {defs} table provides extra Lua values to be used
		 by the pattern.
		
		---
		
		```lua
		function compile(p: any, defs: any)
		  -> unknown
		```
	**/
	@:native("compile")
	@:luaDotMethod
	private function __compile(string:String, ?defs:lua.Table.AnyTable):nvim.type.vim.lpeg.Pattern;
	/**
		```lua
		function vim.re.compile(string: string, defs?: table)
		  -> vim.lpeg.Pattern
		```
		
		---
		
		 Compiles the given {string} and returns an equivalent LPeg pattern. The given string may define
		 either an expression or a grammar. The optional {defs} table provides extra Lua values to be used
		 by the pattern.
		
		---
		
		```lua
		function compile(p: any, defs: any)
		  -> unknown
		```
	**/
	@:luaDotMethod
	inline function compile(string:String, ?defs:lua.Table.AnyTable):nvim.type.vim.lpeg.Pattern {
		defs = nvim.helper.Arg.pure(defs);
		final result = __compile(string, defs);
		return result;
	}
	/**
		```lua
		function vim.re.find(subject: string, pattern: string|vim.lpeg.Pattern, init?: integer)
		  -> integer|nil
		  2. integer|nil
		```
		
		---
		
		 Searches the given {pattern} in the given {subject}. If it finds a match, returns the index
		 where this occurrence starts and the index where it ends. Otherwise, returns nil.
		
		 An optional numeric argument {init} makes the search starts at that position in the subject
		 string. As usual in Lua libraries, a negative value counts from the end.
		
		@*return* — : the index where the occurrence starts, nil if no match
		
		@*return* — : the index where the occurrence ends, nil if no match
		
		---
		
		```lua
		function find(s: any, p: any, i: any)
		  -> unknown
		  2. unknown|nil
		```
	**/
	@:native("find")
	@:luaDotMethod
	private function __find(subject:String, pattern:haxe.extern.EitherType<nvim.type.vim.lpeg.Pattern, String>, ?init:Float):nvim.helper.Multireturn<Null<Float>, Null<Float>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		function vim.re.find(subject: string, pattern: string|vim.lpeg.Pattern, init?: integer)
		  -> integer|nil
		  2. integer|nil
		```
		
		---
		
		 Searches the given {pattern} in the given {subject}. If it finds a match, returns the index
		 where this occurrence starts and the index where it ends. Otherwise, returns nil.
		
		 An optional numeric argument {init} makes the search starts at that position in the subject
		 string. As usual in Lua libraries, a negative value counts from the end.
		
		@*return* — : the index where the occurrence starts, nil if no match
		
		@*return* — : the index where the occurrence ends, nil if no match
		
		---
		
		```lua
		function find(s: any, p: any, i: any)
		  -> unknown
		  2. unknown|nil
		```
	**/
	@:luaDotMethod
	inline function find(subject:String, pattern:haxe.extern.EitherType<nvim.type.vim.lpeg.Pattern, String>, ?init:Float):nvim.helper.Multireturn.Return2<Null<Float>, Null<Float>> {
		final result = __find(subject, pattern, init);
		return new nvim.helper.Multireturn.Return2<Null<Float>, Null<Float>>(result._0, result._1);
	}
	/**
		```lua
		function vim.re.gsub(subject: string, pattern: string|vim.lpeg.Pattern, replacement: string)
		  -> string
		```
		
		---
		
		 Does a global substitution, replacing all occurrences of {pattern} in the given {subject} by
		 {replacement}.
		
		---
		
		```lua
		function gsub(s: any, p: any, rep: any)
		```
	**/
	@:luaDotMethod
	function gsub(subject:String, pattern:haxe.extern.EitherType<nvim.type.vim.lpeg.Pattern, String>, replacement:String):String;
	/**
		```lua
		function vim.re.match(subject: string, pattern: string|vim.lpeg.Pattern, init?: integer)
		  -> integer|vim.lpeg.Pattern|nil
		```
		
		---
		
		 Matches the given {pattern} against the given {subject}, returning all captures.
		See: [vim.lpeg.match](file:///usr/local/share/nvim/runtime/lua/vim/_meta/lpeg.lua#64#9) ()
		
		---
		
		```lua
		function match(s: any, p: any, i: any)
		```
	**/
	@:luaDotMethod
	function match(subject:String, pattern:haxe.extern.EitherType<nvim.type.vim.lpeg.Pattern, String>, ?init:Float):Null<haxe.extern.EitherType<Float, nvim.type.vim.lpeg.Capture>>;
	/**
		```lua
		function vim.re.updatelocale()
		```
		
		---
		
		 Updates the pre-defined character classes to the current locale.
		
		---
		
		```lua
		function updatelocale()
		```
	**/
	@:luaDotMethod
	function updatelocale():Dynamic;
}