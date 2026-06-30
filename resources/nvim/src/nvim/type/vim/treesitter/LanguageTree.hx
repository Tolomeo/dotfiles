package nvim.type.vim.treesitter;

/**
	```lua
	(class) vim.treesitter.LanguageTree
	```
**/
@:structInit class LanguageTree {
	/**
		```lua
		function vim.treesitter.LanguageTree.new(source: string|integer, lang: string, opts?: vim.treesitter.LanguageTree.new.Opts)
		  -> parser: vim.treesitter.LanguageTree
		```
		
		---
		
		 @nodoc
		
		 LanguageTree contains a tree of parsers: the root treesitter parser for {lang} and any
		 "injected" language parsers, which themselves may inject other languages, recursively.
		
		@*param* `source` — Buffer or text string to parse
		
		@*param* `lang` — Root language of this tree
		
		@*return* `parser` — object
	**/
	@:luaDotMethod
	@:native("new")
	extern public function new_(source:haxe.extern.EitherType<Float, String>, lang:String, ?opts:Null<nvim.type.vim.treesitter.languagetree.new_.Opts>):nvim.type.vim.treesitter.LanguageTree;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:_on_bytes(bufnr: integer, changed_tick: integer, start_row: integer, start_col: integer, start_byte: integer, old_row: integer, old_col: integer, old_byte: integer, new_row: integer, new_col: integer, new_byte: integer)
		```
	**/
	extern public function _on_bytes(bufnr:Float, changed_tick:Float, start_row:Float, start_col:Float, start_byte:Float, old_row:Float, old_col:Float, old_byte:Float, new_row:Float, new_col:Float, new_byte:Float):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:_on_detach(...any)
		```
	**/
	extern public function _on_detach(___:haxe.Rest<Dynamic>):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:_on_reload()
		```
	**/
	extern public function _on_reload():Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:_subtract_time(thread_state: { timeout: integer? }, time: integer)
		```
	**/
	@:native("_subtract_time")
	private extern function ___subtract_time(thread_state:nvim.type.ParserThreadState, time:Float):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:_subtract_time(thread_state: { timeout: integer? }, time: integer)
		```
	**/
	inline public function _subtract_time(thread_state:nvim.type.ParserThreadState, time:Float):Dynamic {
		thread_state = nvim.helper.Arg.pure(thread_state);
		final result = ___subtract_time(thread_state, time);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:children()
		  -> table<string, vim.treesitter.LanguageTree>
		```
		
		---
		
		 Returns a map of language to child tree.
	**/
	extern public function children():lua.Table<String, nvim.type.vim.treesitter.LanguageTree>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:contains(range: Range4)
		  -> boolean
		```
		
		---
		
		 Determines whether {range} is contained in the |LanguageTree|.
	**/
	@:native("contains")
	private extern function __contains(range:nvim.type.Range4):Bool;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:contains(range: Range4)
		  -> boolean
		```
		
		---
		
		 Determines whether {range} is contained in the |LanguageTree|.
	**/
	inline public function contains(range:nvim.type.Range4):Bool {
		range = nvim.helper.Arg.pure(range);
		final result = __contains(range);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:destroy()
		```
		
		---
		
		 Destroys this |LanguageTree| and all its children.
		
		 Any cleanup logic should be performed here.
		
		 Note: This DOES NOT remove this tree from a parent. Instead,
		 `remove_child` must be called on the parent to remove it.
	**/
	extern public function destroy():Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:for_each_tree(fn: fun(tree: TSTree, ltree: vim.treesitter.LanguageTree))
		```
		
		---
		
		 Invokes the callback for each |LanguageTree| recursively.
		
		 Note: This includes the invoking tree's child trees as well.
	**/
	extern public function for_each_tree(fn:(tree:nvim.type.TSTree, ltree:nvim.type.vim.treesitter.LanguageTree) -> Dynamic):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:included_regions()
		  -> table<integer, Range6[]>
		```
		
		---
		
		Gets the set of included regions managed by this LanguageTree. This can be different from the
		regions set by injection query, because a partial |LanguageTree:parse()| drops the regions
		outside the requested range.
		Each list represents a range in the form of
		{ {start_row}, {start_col}, {start_bytes}, {end_row}, {end_col}, {end_bytes} }.
	**/
	extern public function included_regions():lua.Table<Float, lua.Table<Int, nvim.type.Range6>>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:invalidate(reload: boolean|nil)
		```
		
		---
		
		 Invalidates this parser and its children.
		
		 Should only be called when the tracked state of the LanguageTree is not valid against the parse
		 tree in treesitter. Doesn't clear filesystem cache. Called often, so needs to be fast.
	**/
	extern public function invalidate(?reload:Null<Bool>):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:is_valid(exclude_children?: boolean, range?: Range2|Range4|Range6)
		  -> boolean
		```
		
		---
		
		 Returns whether this LanguageTree is valid, i.e., |LanguageTree:trees()| reflects the latest
		 state of the source. If invalid, user should call |LanguageTree:parse()|.
		
		@*param* `exclude_children` — whether to ignore the validity of children (default `false`)
		
		@*param* `range` — range to check for validity
	**/
	extern public function is_valid(?exclude_children:Null<Bool>, ?range:Null<nvim.type.Range>):Bool;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:lang()
		  -> string
		```
		
		---
		
		 Gets the language of this tree node.
	**/
	extern public function lang():String;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:language_for_range(range: Range4)
		  -> tree: vim.treesitter.LanguageTree
		```
		
		---
		
		 Gets the appropriate language that contains {range}.
		
		@*return* `tree` — Managing {range}
	**/
	@:native("language_for_range")
	private extern function __language_for_range(range:nvim.type.Range4):nvim.type.vim.treesitter.LanguageTree;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:language_for_range(range: Range4)
		  -> tree: vim.treesitter.LanguageTree
		```
		
		---
		
		 Gets the appropriate language that contains {range}.
		
		@*return* `tree` — Managing {range}
	**/
	inline public function language_for_range(range:nvim.type.Range4):nvim.type.vim.treesitter.LanguageTree {
		range = nvim.helper.Arg.pure(range);
		final result = __language_for_range(range);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:named_node_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSNode?
		```
		
		---
		
		 Gets the smallest named node that contains {range}.
	**/
	@:native("named_node_for_range")
	private extern function __named_node_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:named_node_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSNode?
		```
		
		---
		
		 Gets the smallest named node that contains {range}.
	**/
	inline public function named_node_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSNode> {
		range = nvim.helper.Arg.pure(range);
		opts = nvim.helper.Arg.pure(opts);
		final result = __named_node_for_range(range, opts);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:node_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSNode?
		```
		
		---
		
		 Gets the smallest node that contains {range}.
	**/
	@:native("node_for_range")
	private extern function __node_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSNode>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:node_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSNode?
		```
		
		---
		
		 Gets the smallest node that contains {range}.
	**/
	inline public function node_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSNode> {
		range = nvim.helper.Arg.pure(range);
		opts = nvim.helper.Arg.pure(opts);
		final result = __node_for_range(range, opts);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:parent()
		  -> (vim.treesitter.LanguageTree)?
		```
		
		---
		
		Returns the parent tree. `nil` for the root tree.
	**/
	extern public function parent():Null<nvim.type.vim.treesitter.LanguageTree>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:parse(range: boolean|Range2|Range4|Range6|nil, on_parse?: fun(err?: string, trees?: table<integer, TSTree>))
		  -> table<integer, TSTree>?
		```
		
		---
		
		 Recursively parse all regions in the language tree using |treesitter-parsers|
		 for the corresponding languages and run injection queries on the parsed trees
		 to determine whether child trees should be created and parsed.
		
		 Any region with empty range (`{}`, typically only the root tree) is always parsed;
		 otherwise (typically injections) only if it intersects {range} (or if {range} is `true`).
		
		@*param* `range` — : Parse this range in the parser's source.
		
		     Set to `true` to run a complete parse of the source (Note: Can be slow!)
		     Set to `false|nil` to only parse regions with empty ranges (typically
		     only the root tree without injections).
		
		@*param* `on_parse` — Function invoked when parsing completes.
		
		     When provided and `vim.g._ts_force_sync_parsing` is not set, parsing will run
		     asynchronously. The first argument to the function is a string representing the error type,
		     in case of a failure (currently only possible for timeouts). The second argument is the list
		     of trees returned by the parse (upon success), or `nil` if the parse timed out (determined
		     by 'redrawtime').
		
		     If parsing was still able to finish synchronously (within 3ms), `parse()` returns the list
		     of trees. Otherwise, it returns `nil`.
	**/
	extern public function parse(?range:Null<haxe.extern.EitherType<Bool, nvim.type.Range>>, ?on_parse:Null<(err:String, trees:lua.Table<Float, nvim.type.TSTree>) -> Dynamic>):Null<lua.Table<Float, nvim.type.TSTree>>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:register_cbs(cbs: table<'on_bytes'|'on_changedtree'|'on_child_added'|'on_child_removed'|'on_detach', function>, recursive?: boolean)
		```
		
		---
		
		 Registers callbacks for the [LanguageTree].
		
		@*param* `cbs` — An [nvim_buf_attach()]-like table argument with the following handlers:
		
		           - `on_bytes` : see [nvim_buf_attach()].
		           - `on_changedtree` : a callback that will be called every time the tree has syntactical changes.
		              It will be passed two arguments: a table of the ranges (as node ranges) that
		              changed and the changed tree.
		           - `on_child_added` : emitted when a child is added to the tree.
		           - `on_child_removed` : emitted when a child is removed from the tree.
		           - `on_detach` : emitted when the buffer is detached, see [nvim_buf_detach_event].
		              Takes one argument, the number of the buffer.
		
		@*param* `recursive` — Apply callbacks recursively for all children. Any new children will
		
		                           also inherit the callbacks.
	**/
	@:native("register_cbs")
	private extern function __register_cbs(cbs:lua.Table<nvim.type.TSCallbackNameOn, haxe.Constraints.Function>, ?recursive:Bool):Dynamic;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:register_cbs(cbs: table<'on_bytes'|'on_changedtree'|'on_child_added'|'on_child_removed'|'on_detach', function>, recursive?: boolean)
		```
		
		---
		
		 Registers callbacks for the [LanguageTree].
		
		@*param* `cbs` — An [nvim_buf_attach()]-like table argument with the following handlers:
		
		           - `on_bytes` : see [nvim_buf_attach()].
		           - `on_changedtree` : a callback that will be called every time the tree has syntactical changes.
		              It will be passed two arguments: a table of the ranges (as node ranges) that
		              changed and the changed tree.
		           - `on_child_added` : emitted when a child is added to the tree.
		           - `on_child_removed` : emitted when a child is removed from the tree.
		           - `on_detach` : emitted when the buffer is detached, see [nvim_buf_detach_event].
		              Takes one argument, the number of the buffer.
		
		@*param* `recursive` — Apply callbacks recursively for all children. Any new children will
		
		                           also inherit the callbacks.
	**/
	inline public function register_cbs(cbs:lua.Table<nvim.type.TSCallbackNameOn, haxe.Constraints.Function>, ?recursive:Bool):Dynamic {
		cbs = nvim.helper.Arg.pure(cbs);
		final result = __register_cbs(cbs, recursive);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:source()
		  -> string|integer
		```
		
		---
		
		 Returns the source content of the language tree (bufnr or string).
	**/
	extern public function source():haxe.extern.EitherType<Float, String>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:tree_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSTree?
		```
		
		---
		
		 Gets the tree that contains {range}.
	**/
	@:native("tree_for_range")
	private extern function __tree_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSTree>;
	/**
		```lua
		(method) vim.treesitter.LanguageTree:tree_for_range(range: Range4, opts?: vim.treesitter.LanguageTree.tree_for_range.Opts)
		  -> TSTree?
		```
		
		---
		
		 Gets the tree that contains {range}.
	**/
	inline public function tree_for_range(range:nvim.type.Range4, ?opts:nvim.type.vim.treesitter.languagetree.tree_for_range.Opts):Null<nvim.type.TSTree> {
		range = nvim.helper.Arg.pure(range);
		opts = nvim.helper.Arg.pure(opts);
		final result = __tree_for_range(range, opts);
		return result;
	}
	/**
		```lua
		(method) vim.treesitter.LanguageTree:trees()
		  -> table<integer, TSTree>
		```
		
		---
		
		 Returns all trees of the regions parsed by this parser.
		 Does not include child languages.
		 The result is list-like if
		 * this LanguageTree is the root, in which case the result is empty or a singleton list; or
		 * the root LanguageTree is fully parsed.
	**/
	extern public function trees():lua.Table<Float, nvim.type.TSTree>;
}