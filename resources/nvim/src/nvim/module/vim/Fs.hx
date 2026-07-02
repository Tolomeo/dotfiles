package nvim.module.vim;

extern class Fs {
	/**
		```lua
		function M.abspath(path: string)
		  -> Absolute: string
		```
		
		---
		
		 Convert path to an absolute path. A tilde (~) character at the beginning of the path is expanded
		 to the user's home directory. Does not check if the path exists, normalize the path, resolve
		 symlinks or hardlinks (including `.` and `..`), or expand environment variables. If the path is
		 already absolute, it is returned unchanged. Also converts `\` path separators to `/`.
		
		@*param* `path` — Path
		
		@*return* `Absolute` — path
	**/
	@:luaDotMethod
	function abspath(path:String):String;
	/**
		```lua
		function M.basename(file: <T:string|nil>)
		  -> Basename: <T:string|nil>
		```
		
		---
		
		 Return the basename of the given path
		
		@*param* `file` — Path
		
		@*return* `Basename` — of {file}
	**/
	@:luaDotMethod
	function basename<T:(Null<String>)>(file:T):T;
	@:native("dir")
	@:luaDotMethod
	private function __dir(path:String, ?opts:nvim.type.vim.fs.dir.Opts):nvim.type.Iterator_;
	/**
		```lua
		function M.dir(path: string, opts?: vim.fs.dir.Opts)
		  -> over: fun():string?, string?
		```
		
		---
		
		 Return an iterator over the items located in {path}
		
		@*param* `path` — An absolute or relative path to the directory to iterate
		
		            over. The path is first normalized |vim.fs.normalize()|.
		
		@*param* `opts` — Optional keyword arguments:
		
		@*return* `over` — items in {path}. Each iteration yields two values: "name" and "type".
		
		        "name" is the basename of the item relative to {path}.
		        "type" is one of the following:
		        "file", "directory", "link", "fifo", "socket", "char", "block", "unknown".
	**/
	@:luaDotMethod
	inline function dir(path:String, ?opts:nvim.type.vim.fs.dir.Opts):nvim.type.Iterator_ {
		opts = nvim.helper.Arg.pure(opts);
		final result = __dir(path, opts);
		return result;
	}
	/**
		```lua
		function M.dirname(file: <T:string|nil>)
		  -> Parent: <T:string|nil>
		```
		
		---
		
		 Gets the parent directory of the given path (not expanded/resolved, the caller must do that).
		
		@*param* `file` — Path
		
		@*return* `Parent` — directory of {file}
	**/
	@:luaDotMethod
	function dirname<T:(Null<String>)>(file:T):T;
	@:native("find")
	@:luaDotMethod
	private function __find(names:haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table<Int, String>, (name:String, path:String) -> Bool>>, ?opts:nvim.type.vim.fs.find.Opts):lua.Table<Int, String>;
	/**
		```lua
		function M.find(names: string|fun(name: string, path: string):boolean|string[], opts?: vim.fs.find.Opts)
		  -> string[]
		```
		
		---
		
		 Find files or directories (or other items as specified by `opts.type`) in the given path.
		
		 Finds items given in {names} starting from {path}. If {upward} is "true"
		 then the search traverses upward through parent directories; otherwise,
		 the search traverses downward. Note that downward searches are recursive
		 and may search through many directories! If {stop} is non-nil, then the
		 search stops when the directory given in {stop} is reached. The search
		 terminates when {limit} (default 1) matches are found. You can set {type}
		 to "file", "directory", "link", "socket", "char", "block", or "fifo"
		 to narrow the search to find only that type.
		
		 Examples:
		
		 ```lua
		 -- List all test directories under the runtime directory.
		 local dirs = vim.fs.find(
		   { 'test', 'tst', 'testdir' },
		   { limit = math.huge, type = 'directory', path = './runtime/' }
		 )
		
		 -- Get all "lib/*.cpp" and "lib/*.hpp" files, using Lua patterns.
		 -- Or use `vim.glob.to_lpeg(…):match(…)` for glob/wildcard matching.
		 local files = vim.fs.find(function(name, path)
		   return name:match('.*%.[ch]pp$') and path:match('[/\\]lib$')
		 end, { limit = math.huge, type = 'file' })
		 ```
		
		@*param* `names` — Names of the items to find.
		
		             Must be base names, paths and globs are not supported when {names} is a string or a table.
		             If {names} is a function, it is called for each traversed item with args:
		             - name: base name of the current item
		             - path: full path of the current item
		
		             The function should return `true` if the given item is considered a match.
		
		@*param* `opts` — Optional keyword arguments:
		
		@*return* — Normalized paths |vim.fs.normalize()| of all matching items
	**/
	@:luaDotMethod
	inline function find(names:haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table<Int, String>, (name:String, path:String) -> Bool>>, ?opts:nvim.type.vim.fs.find.Opts):lua.Table<Int, String> {
		opts = nvim.helper.Arg.pure(opts);
		final result = __find(names, opts);
		return result;
	}
	/**
		```lua
		function M.joinpath(...string)
		  -> string
		```
		
		---
		
		 Concatenates partial paths (one absolute or relative path followed by zero or more relative
		 paths). Slashes are normalized: redundant slashes are removed, and (on Windows) backslashes are
		 replaced with forward-slashes.
		
		 Examples:
		 - "foo/", "/bar" => "foo/bar"
		 - Windows: "a\foo\", "\bar" => "a/foo/bar"
	**/
	@:luaDotMethod
	function joinpath(___:haxe.Rest<String>):String;
	@:native("normalize")
	@:luaDotMethod
	private function __normalize(path:String, ?opts:nvim.type.vim.fs.normalize.Opts):String;
	/**
		```lua
		function M.normalize(path: string, opts?: vim.fs.normalize.Opts)
		  -> string
		```
		
		---
		
		 Normalize a path to a standard format. A tilde (~) character at the beginning of the path is
		 expanded to the user's home directory and environment variables are also expanded. "." and ".."
		 components are also resolved, except when the path is relative and trying to resolve it would
		 result in an absolute path.
		 - "." as the only part in a relative path:
		   - "." => "."
		   - "././" => "."
		 - ".." when it leads outside the current directory
		   - "foo/../../bar" => "../bar"
		   - "../../foo" => "../../foo"
		 - ".." in the root directory returns the root directory.
		   - "/../../" => "/"
		
		 On Windows, backslash (\) characters are converted to forward slashes (/).
		
		 Examples:
		 ```lua
		 [[C:\Users\jdoe]]                         => "C:/Users/jdoe"
		 "~/src/neovim"                            => "/home/jdoe/src/neovim"
		 "$XDG_CONFIG_HOME/nvim/init.vim"          => "/Users/jdoe/.config/nvim/init.vim"
		 "~/src/nvim/api/../tui/./tui.c"           => "/home/jdoe/src/nvim/tui/tui.c"
		 "./foo/bar"                               => "foo/bar"
		 "foo/../../../bar"                        => "../../bar"
		 "/home/jdoe/../../../bar"                 => "/bar"
		 "C:foo/../../baz"                         => "C:../baz"
		 "C:/foo/../../baz"                        => "C:/baz"
		 [[\\?\UNC\server\share\foo\..\..\..\bar]] => "//?/UNC/server/share/bar"
		 ```
		
		@*param* `path` — Path to normalize
		
		@*return* — : Normalized path
	**/
	@:luaDotMethod
	inline function normalize(path:String, ?opts:nvim.type.vim.fs.normalize.Opts):String {
		opts = nvim.helper.Arg.pure(opts);
		final result = __normalize(path, opts);
		return result;
	}
	@:native("parents")
	@:luaDotMethod
	private function __parents(start:String):nvim.helper.Multireturn<() -> Null<String>, nvim.helper.Nothing, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		function M.parents(start: string)
		  -> fun(_: any, dir: string):string?
		  2. nil
		  3. string|nil
		```
		
		---
		
		 Iterate over all the parents of the given path (not expanded/resolved, the caller must do that).
		
		 Example:
		
		 ```lua
		 local root_dir
		 for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
		   if vim.fn.isdirectory(dir .. '/.git') == 1 then
		     root_dir = dir
		     break
		   end
		 end
		
		 if root_dir then
		   print('Found git repository at', root_dir)
		 end
		 ```
		
		@*param* `start` — Initial path.
		
		@*return* — Iterator
		
		@*return*
		
		@*return*
	**/
	@:luaDotMethod
	inline function parents(start:String):nvim.helper.Multireturn.Return3<() -> Null<String>, nvim.helper.Nothing, Null<String>> {
		final result = __parents(start);
		return new nvim.helper.Multireturn.Return3<() -> Null<String>, nvim.helper.Nothing, Null<String>>(result._0, result._1, result._2);
	}
	/**
		```lua
		function M.relpath(base: string, target: string, opts?: table)
		  -> string|nil
		```
		
		---
		
		 Gets `target` path relative to `base`, or `nil` if `base` is not an ancestor.
		
		 Example:
		
		 ```lua
		 vim.fs.relpath('/var', '/var/lib') -- 'lib'
		 vim.fs.relpath('/var', '/usr/bin') -- nil
		 ```
		
		@*param* `opts` — Reserved for future use
	**/
	@:luaDotMethod
	function relpath(base:String, target:String, ?opts:Null<lua.Table.AnyTable>):Null<String>;
	@:native("rm")
	@:luaDotMethod
	private function __rm(path:String, ?opts:nvim.type.vim.fs.rm.Opts):Dynamic;
	/**
		```lua
		function M.rm(path: string, opts?: vim.fs.rm.Opts)
		```
		
		---
		
		 Remove files or directories
		 @since 13
		
		@*param* `path` — Path to remove
	**/
	@:luaDotMethod
	inline function rm(path:String, ?opts:nvim.type.vim.fs.rm.Opts):Dynamic {
		opts = nvim.helper.Arg.pure(opts);
		final result = __rm(path, opts);
		return result;
	}
	/**
		```lua
		function M.root(source: string|integer, marker: string|(string|fun(name: string, path: string):boolean|string[])[]|fun(name: string, path: string):boolean)
		  -> string?
		```
		
		---
		
		 Find the first parent directory containing a specific "marker", relative to a file path or
		 buffer.
		
		 If the buffer is unnamed (has no backing file) or has a non-empty 'buftype' then the search
		 begins from Nvim's |current-directory|.
		
		 Examples:
		
		 ```lua
		 -- Find the root of a Python project, starting from file 'main.py'
		 vim.fs.root(vim.fs.joinpath(vim.env.PWD, 'main.py'), {'pyproject.toml', 'setup.py' })
		
		 -- Find the root of a git repository
		 vim.fs.root(0, '.git')
		
		 -- Find the parent directory containing any file with a .csproj extension
		 vim.fs.root(0, function(name, path)
		   return name:match('%.csproj$') ~= nil
		 end)
		
		 -- Find the first ancestor directory containing EITHER "stylua.toml" or ".luarc.json"; if
		 -- not found, find the first ancestor containing ".git":
		 vim.fs.root(0, { { 'stylua.toml', '.luarc.json' }, '.git' })
		 ```
		
		 @since 12
		
		@*param* `source` — Buffer number (0 for current buffer) or file path (absolute or
		
		               relative to the |current-directory|) to begin the search from.
		               Filename, function, or list thereof, that decides how to find the root. To
		               indicate "equal priority", specify items in a nested list `{ { 'a.txt', 'b.lua' }, … }`.
		               A function item must return true if `name` and `path` are a match. Each item
		               (which may itself be a nested list) is evaluated in-order against all ancestors,
		               until a match is found.
		
		@*return* — Directory path containing one of the given markers, or nil if no directory was
		
		                   found.
	**/
	@:luaDotMethod
	function root(source:haxe.extern.EitherType<Float, String>, marker:haxe.extern.EitherType<lua.Table<Int, haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table<Int, String>, (name:String, path:String) -> Bool>>>, haxe.extern.EitherType<String, (name:String, path:String) -> Bool>>):Null<String>;
}