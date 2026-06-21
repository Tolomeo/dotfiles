package nvim.type.vim;

/**
	```lua
	(class) vim.regex
	```
	
	---
	
	 @nodoc
**/
@:structInit class Regex {
	/**
		```lua
		(method) vim.regex:match_line(bufnr: integer, line_idx: integer, start?: integer, end_?: integer)
		  -> integer?
		  2. integer?
		```
		
		---
		
		 Matches line at `line_idx` (zero-based) in buffer `bufnr`. Match is restricted to byte index
		 range `start` and `end_` if given, otherwise see |regex:match_str()|. Returned byte indices are
		 relative to `start` if given.
		
		@*return* — match start (byte index) relative to `start`, or `nil` if no match
		
		@*return* — match end (byte index) relative to `start`, or `nil` if no match
	**/
	extern function match_line(bufnr:Int, line_idx:Int, ?start:Int, ?end_:Int):nvim.helper.Multireturn<Null<Int>, Null<Int>, Void, Void, Void, Void>;
	/**
		```lua
		(method) vim.regex:match_str(str: string)
		  -> integer?
		  2. integer?
		```
		
		---
		
		 Matches string `str` against this regex. To match the string precisely, surround the regex with
		 "^" and "$". Returns the byte indices for the start and end of the match, or `nil` if there is
		 no match. Because any integer is "truthy", `regex:match_str()` can be directly used as
		 a condition in an if-statement.
		
		@*return* — match start (byte index), or `nil` if no match
		
		@*return* — match end (byte index), or `nil` if no match
	**/
	extern function match_str(str:String):nvim.helper.Multireturn<Null<Int>, Null<Int>, Void, Void, Void, Void>;
}