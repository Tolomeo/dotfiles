package nvim.helper;

@:multiReturn extern class LuaMultireturn<T0, T1, T2, T3, T4, T5> {
	public var _0:T0;
	public var _1:T1;
	public var _2:T2;
	public var _3:T3;
	public var _4:T4;
	public var _5:T5;
}

@:forward
abstract Multireturn<T0, T1, T2, T3, T4, T5>(LuaMultireturn<T0, T1, T2, T3, T4, T5>) {
	@:to
	inline function toReturn2():Return2<T0, T1> {
		return new Return2(this._0, this._1);
	}

	@:to
	inline function toReturn3():Return3<T0, T1, T2> {
		return new Return3(this._0, this._1, this._2);
	}

	@:to
	inline function toReturn4():Return4<T0, T1, T2, T3> {
		return new Return4(this._0, this._1, this._2, this._3);
	}

	@:to
	inline function toReturn5():Return5<T0, T1, T2, T3, T4> {
		return new Return5(this._0, this._1, this._2, this._3, this._4);
	}

	@:to
	inline function toReturn6():Return6<T0, T1, T2, T3, T4, T5> {
		return new Return6(this._0, this._1, this._2, this._3, this._4, this._5);
	}
}

abstract Return2<T0, T1>(Array<Any>) {
	public inline function new(a:T0, b:T1) {
		this = [a, b];
	}

	function get_0():T0 {
		return this[0];
	}

	function get_1():T1 {
		return this[1];
	}
}

abstract Return3<T0, T1, T2>(Array<Any>) {
	public inline function new(a:T0, b:T1, c:T2) {
		this = [a, b, c];
	}

	public var _0(get, never):T0;

	function get__0():T0 {
		return this[0];
	}

	public var _1(get, never):T1;

	function get__1():T1 {
		return this[1];
	}

	public var _2(get, never):T2;

	function get__2():T2 {
		return this[2];
	}
}

abstract Return4<T0, T1, T2, T3>(Array<Any>) {
	public inline function new(a:T0, b:T1, c:T2, d:T3) {
		this = [a, b, c, d];
	}

	public var _0(get, never):T0;

	function get__0():T0 {
		return this[0];
	}

	public var _1(get, never):T1;

	function get__1():T1 {
		return this[1];
	}

	public var _2(get, never):T2;

	function get__2():T2 {
		return this[2];
	}

	public var _3(get, never):T3;

	function get__3():T3 {
		return this[3];
	}
}

abstract Return5<T0, T1, T2, T3, T4>(Array<Any>) {
	public inline function new(a:T0, b:T1, c:T2, d:T3, e:T4) {
		this = [a, b, c, d, e];
	}

	public var _0(get, never):T0;

	function get__0():T0 {
		return this[0];
	}

	public var _1(get, never):T1;

	function get__1():T1 {
		return this[1];
	}

	public var _2(get, never):T2;

	function get__2():T2 {
		return this[2];
	}

	public var _3(get, never):T3;

	function get__3():T3 {
		return this[3];
	}

	public var _4(get, never):T4;

	function get__4():T4 {
		return this[4];
	}
}

abstract Return6<T0, T1, T2, T3, T4, T5>(Array<Any>) {
	public inline function new(a:T0, b:T1, c:T2, d:T3, e:T4, f:T5) {
		this = [a, b, c, d, e, f];
	}

	public var _0(get, never):T0;

	function get__0():T0 {
		return this[0];
	}

	public var _1(get, never):T1;

	function get__1():T1 {
		return this[1];
	}

	public var _2(get, never):T2;

	function get__2():T2 {
		return this[2];
	}

	public var _3(get, never):T3;

	function get__3():T3 {
		return this[3];
	}

	public var _4(get, never):T4;

	function get__4():T4 {
		return this[4];
	}

	public var _5(get, never):T5;

	function get__5():T5 {
		return this[5];
	}
}
