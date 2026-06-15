package nvim.type.lsp;

extern typedef NotebookDocumentFilter = haxe.extern.EitherType<nvim.type.lsp.NotebookDocumentFilterNotebookType, haxe.extern.EitherType<nvim.type.lsp.NotebookDocumentFilterScheme, nvim.type.lsp.NotebookDocumentFilterPattern>>;