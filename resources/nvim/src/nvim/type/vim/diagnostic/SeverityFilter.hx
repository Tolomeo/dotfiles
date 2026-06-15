package nvim.type.vim.diagnostic;

extern typedef SeverityFilter = haxe.extern.EitherType<nvim.type.vim.diagnostic.Severity, haxe.extern.EitherType<Array<nvim.type.vim.diagnostic.Severity>, { var min : nvim.type.vim.diagnostic.Severity; var max : nvim.type.vim.diagnostic.Severity; }>>;