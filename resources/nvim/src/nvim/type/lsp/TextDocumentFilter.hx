package nvim.type.lsp;

extern typedef TextDocumentFilter = haxe.extern.EitherType<nvim.type.lsp.TextDocumentFilterLanguage, haxe.extern.EitherType<nvim.type.lsp.TextDocumentFilterScheme, nvim.type.lsp.TextDocumentFilterPattern>>;