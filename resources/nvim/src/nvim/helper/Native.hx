package nvim.helper;

function nativeTable(tableValue:lua.Table.AnyTable):lua.Table.AnyTable {
	final tab = Table.create();

	lua.PairTools.ipairsEach(tableValue, (i, t) -> {
		lua.Table.insert(tab, native(t));
	});

	lua.PairTools.pairsEach(tableValue, (k, t) -> {
		if (["__fields__", "length"].contains(k)) {
			return;
		}

		if (k == cast 0) {
			lua.Table.insert(tab, 1, t);
			return;
		}

		untyped tab[k] = native(t);
	});

	return tab;
}

function native<T>(value:T):T {
	if (lua.Lua.type(value) == 'table') {
		return cast nativeTable(cast value);
	}

	return value;
}

@:forward
abstract LuaArray<T>(lua.Table<Int, T>) from lua.Table<Int, T> {
	@:from
	public static function fromArray<T>(arr:Array<T>):LuaArray<T> {
		return lua.Table.fromArray(arr);
	}

	@:to function toTableArray():lua.Table<Int, T> {
		return native(this);
	}
}

@:forward
abstract LuaObject<T>(T) from T {
	@:to
	public function toTableObject():T {
		return native(this);
	}
}
