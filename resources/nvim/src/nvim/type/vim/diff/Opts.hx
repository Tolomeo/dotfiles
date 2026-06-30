package nvim.type.vim.diff;

/**
	```lua
	(class) vim.diff.Opts
	```
	
	---
	
	 Optional parameters:
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.diff.Opts.algorithm: ('histogram'|'minimal'|'myers'|'patience')?
		```
		
		---
		
		
		 Diff algorithm to use. Values:
		   - `myers`: the default algorithm
		   - `minimal`: spend extra time to generate the smallest possible diff
		   - `patience`: patience diff algorithm
		   - `histogram`: histogram diff algorithm
		 (default: `'myers'`)
	**/
	@:optional
	extern public var algorithm : Null<String>;
	/**
		```lua
		(field) vim.diff.Opts.ctxlen: integer?
		```
		
		---
		
		Context length
	**/
	@:optional
	extern public var ctxlen : Null<Float>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_blank_lines: boolean?
		```
		
		---
		
		Ignore blank lines
	**/
	@:optional
	extern public var ignore_blank_lines : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_cr_at_eol: boolean?
		```
		
		---
		
		Ignore carriage return at end-of-line
	**/
	@:optional
	extern public var ignore_cr_at_eol : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace: boolean?
		```
		
		---
		
		Ignore whitespace
	**/
	@:optional
	extern public var ignore_whitespace : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace_change: boolean?
		```
		
		---
		
		Ignore whitespace change
	**/
	@:optional
	extern public var ignore_whitespace_change : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace_change_at_eol: boolean?
		```
		
		---
		
		Ignore whitespace change at end-of-line.
	**/
	@:optional
	extern public var ignore_whitespace_change_at_eol : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.indent_heuristic: boolean?
		```
		
		---
		
		Use the indent heuristic for the internal diff library.
	**/
	@:optional
	extern public var indent_heuristic : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.interhunkctxlen: integer?
		```
		
		---
		
		Inter hunk context length
	**/
	@:optional
	extern public var interhunkctxlen : Null<Float>;
	/**
		```lua
		(field) vim.diff.Opts.linematch: (boolean|integer)?
		```
		
		---
		
		
		 Run linematch on the resulting hunks from xdiff. When integer, only hunks
		 upto this size in lines are run through linematch.
		 Requires `result_type = indices`, ignored otherwise.
	**/
	@:optional
	extern public var linematch : Null<haxe.extern.EitherType<Bool, Float>>;
	/**
		```lua
		(field) vim.diff.Opts.on_hunk: fun(start_a: integer, count_a: integer, start_b: integer, count_b: integer):integer??
		```
		
		---
		
		 @inlinedoc
		
		 Invoked for each hunk in the diff. Return a negative number
		 to cancel the callback for any remaining hunks.
		 Arguments:
		   - `start_a` (`integer`): Start line of hunk in {a}.
		   - `count_a` (`integer`): Hunk size in {a}.
		   - `start_b` (`integer`): Start line of hunk in {b}.
		   - `count_b` (`integer`): Hunk size in {b}.
		
		---
		
		```lua
		function (start_a: integer, count_a: integer, start_b: integer, count_b: integer)
		  -> integer?
		```
	**/
	@:optional
	extern public var on_hunk : Null<(start_a:Float, count_a:Float, start_b:Float, count_b:Float) -> Null<Float>>;
	/**
		```lua
		(field) vim.diff.Opts.result_type: ('indices'|'unified')?
		```
		
		---
		
		
		 Form of the returned diff:
		   - `unified`: String in unified format.
		   - `indices`: Array of hunk locations.
		 Note: This option is ignored if `on_hunk` is used.
		 (default: `'unified'`)
	**/
	@:optional
	extern public var result_type : Null<String>;
}