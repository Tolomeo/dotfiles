package nvim.type.vim.filetype;

extern typedef Mapfn = (path:String, bufnr:Int) -> nvim.helper.Multireturn<Null<String>, Null<(b:Int) -> Dynamic>, Void, Void, Void, Void>;