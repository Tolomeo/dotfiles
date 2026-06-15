package nvim.type.lsp;

extern typedef Handler = (err:Null<nvim.type.lsp.ResponseError>, result:Any, context:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable) -> Any;