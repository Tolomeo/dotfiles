package nvim.type.lsp;

extern typedef LSPAny = haxe.extern.EitherType<nvim.type.lsp.LSPObject, haxe.extern.EitherType<nvim.type.lsp.LSPArray, haxe.extern.EitherType<String, haxe.extern.EitherType<Float, haxe.extern.EitherType<nvim.type.Uinteger, haxe.extern.EitherType<nvim.type.Decimal, haxe.extern.EitherType<Bool, nvim.type.lsp.Null>>>>>>>;