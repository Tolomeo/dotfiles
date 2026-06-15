package nvim.type.vim.lsp.client;

/**
	```lua
	(class) vim.lsp.Client.Flags
	```
**/
@:structInit extern class Flags {
	/**
		```lua
		(field) vim.lsp.Client.Flags.allow_incremental_sync: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Allow using incremental sync for buffer edits
		 (default: `true`)
	**/
	var allow_incremental_sync : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.Client.Flags.debounce_text_changes: integer
		```
		
		---
		
		
		 Debounce `didChange` notifications to the server by the given number in milliseconds.
		 No debounce occurs if `nil`.
		 (default: `150`)
	**/
	var debounce_text_changes : Int;
	/**
		```lua
		(field) vim.lsp.Client.Flags.exit_timeout: integer|false
		```
		
		---
		
		
		 Milliseconds to wait for server to exit cleanly after sending the
		 "shutdown" request before sending kill -15. If set to false, nvim exits
		 immediately after sending the "shutdown" request to the server.
		 (default: `false`)
	**/
	var exit_timeout : haxe.extern.EitherType<Int, Bool>;
}