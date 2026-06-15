package nvim.type.vim.validate;

extern typedef Validator = haxe.extern.EitherType<nvim.type.Type, haxe.extern.EitherType<String, haxe.extern.EitherType<Array<haxe.extern.EitherType<nvim.type.Type, String>>, (v:Any) -> nvim.helper.Multireturn<Bool, Null<String>, Void, Void, Void, Void>>>>;