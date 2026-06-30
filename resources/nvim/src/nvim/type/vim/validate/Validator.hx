package nvim.type.vim.validate;

extern typedef Validator = haxe.extern.EitherType<nvim.type.Type, haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table<Int, haxe.extern.EitherType<nvim.type.Type, String>>, (v:Any) -> nvim.helper.Multireturn<Bool, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>>>>;