package nvim.module.vim.lsp;

extern class Handlers {
	@:native("hover")
	@:luaDotMethod
	private function __hover(_:Null<nvim.type.lsp.ResponseError>, result:nvim.type.lsp.Hover, ctx:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		(global) vim.lsp.handlers.hover: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/hover"
		
		 ```lua
		 vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		   vim.lsp.handlers.hover, {
		     -- Use a sharp border with `FloatBorder` highlights
		     border = "single",
		     -- add the title in hover float window
		     title = "hover"
		   }
		 )
		 ```
		
		@*param* `config` — Configuration table.
		
		     - border:     (default=nil)
		         - Add borders to the floating window
		         - See |vim.lsp.util.open_floating_preview()| for more options.
		
		---
		
		```lua
		function (err: (lsp.ResponseError)?, result: any, context: lsp.HandlerContext, config?: table)
		  -> ...unknown
		```
	**/
	@:luaDotMethod
	@:deprecated
	inline function hover(_:Null<nvim.type.lsp.ResponseError>, result:nvim.type.lsp.Hover, ctx:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable):Dynamic {
		result = nvim.helper.Arg.pure(result);
		ctx = nvim.helper.Arg.pure(ctx);
		config = nvim.helper.Arg.pure(config);
		final result = __hover(_, result, ctx, config);
		return result;
	}
	@:native("signature_help")
	@:luaDotMethod
	private function __signature_help(_:Null<nvim.type.lsp.ResponseError>, result:Null<nvim.type.lsp.SignatureHelp>, ctx:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		(global) vim.lsp.handlers.signature_help: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/signatureHelp".
		
		 The active parameter is highlighted with |hl-LspSignatureActiveParameter|.
		
		 ```lua
		 vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		   vim.lsp.handlers.signature_help, {
		     -- Use a sharp border with `FloatBorder` highlights
		     border = "single"
		   }
		 )
		 ```
		
		@*param* `result` — Response from the language server
		
		@*param* `ctx` — Client context
		
		@*param* `config` — Configuration table.
		
		     - border:     (default=nil)
		         - Add borders to the floating window
		         - See |vim.lsp.util.open_floating_preview()| for more options
		
		---
		
		```lua
		function (err: (lsp.ResponseError)?, result: any, context: lsp.HandlerContext, config?: table)
		  -> ...unknown
		```
	**/
	@:luaDotMethod
	@:deprecated
	inline function signature_help(_:Null<nvim.type.lsp.ResponseError>, result:Null<nvim.type.lsp.SignatureHelp>, ctx:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable):Dynamic {
		ctx = nvim.helper.Arg.pure(ctx);
		config = nvim.helper.Arg.pure(config);
		final result = __signature_help(_, result, ctx, config);
		return result;
	}
}