package nvim.helper;

class Arg {
		inline public static function pureTable<T>(obj:T):T {
			untyped obj.__fields__ = null;
			lua.Lua.setmetatable(cast obj, null);
			return obj;
		}

    public static function pure<T>(obj:T):T {
			return lua.Lua.type(obj) == 'table' ? pureTable(obj) : obj;
    }
}
