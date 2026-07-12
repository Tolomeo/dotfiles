package nvim.type.lsp;

extern typedef MultiHandler = (results:lua.Table<Int, { @:optional
	var err : Null<nvim.type.lsp.ResponseError>; var result : Any; }>, context:nvim.type.lsp.HandlerContext, config:lua.Table.AnyTable) -> Any;