package nvim.type.vim.filetype;

extern typedef Mapfn = (path:String, bufnr:Float) -> nvim.helper.Multireturn<Null<String>, Null<(b:Float) -> Dynamic>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;