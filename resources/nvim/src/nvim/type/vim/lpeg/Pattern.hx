package nvim.type.vim.lpeg;

/**
	```lua
	(class) vim.lpeg.Pattern
	```
	
	---
	
	 @nodoc
**/
@:structInit class Pattern {
	/**
		```lua
		(method) vim.lpeg.Pattern:match(subject: string, init?: integer, ...any)
		  -> ...any
		```
		
		---
		
		 Matches the given `pattern` against the `subject` string. If the match succeeds, returns the
		 index in the subject of the first character after the match, or the captured values (if the
		 pattern captured any value). An optional numeric argument `init` makes the match start at
		 that position in the subject string. As usual in Lua libraries, a negative value counts from the end.
		 Unlike typical pattern-matching functions, `match` works only in anchored mode; that is, it tries
		 to match the pattern with a prefix of the given subject string (at position `init`), not with
		 an arbitrary substring of the subject. So, if we want to find a pattern anywhere in a string,
		 we must either write a loop in Lua or write a pattern that matches anywhere.
		
		 Example:
		
		 ```lua
		 local pattern = lpeg.R('az') ^ 1 * -1
		 assert(pattern:match('hello') == 6)
		 assert(lpeg.match(pattern, 'hello') == 6)
		 assert(pattern:match('1 hello') == nil)
		 ```
	**/
	extern function match(subject:String, ?init:Int, ___:haxe.Rest<Any>):Any;
}