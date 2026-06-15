package nvim.module.vim;

extern class Secure {
	/**
		```lua
		function M.read(path: string)
		  -> If: boolean|string|nil
		```
		
		---
		
		 If {path} is a file: attempt to read the file, prompting the user if the file should be
		 trusted.
		
		 If {path} is a directory: return true if the directory is trusted (non-recursive), prompting
		 the user as necessary.
		
		 The user's choice is persisted in a trust database at
		 $XDG_STATE_HOME/nvim/trust.
		
		
		@*param* `path` — Path to a file or directory to read.
		
		
		@*return* `If` — {path} is not trusted or does not exist, returns `nil`. Otherwise,
		
		        returns the contents of {path} if it is a file, or true if {path} is a directory.
	**/
	@:luaDotMethod
	function read(path:String):Null<haxe.extern.EitherType<Bool, String>>;
	/**
		```lua
		function M.trust(opts: vim.trust.opts)
		  -> success: boolean
		  2. msg: string
		```
		
		---
		
		 Manage the trust database.
		
		 The trust database is located at |$XDG_STATE_HOME|/nvim/trust.
		
		@*return* `success` — true if operation was successful
		
		@*return* `msg` — full path if operation was successful, else error message
	**/
	@:luaDotMethod
	function trust(opts:nvim.type.vim.trust.Opts):nvim.helper.Multireturn<Bool, String, Void, Void, Void, Void>;
}