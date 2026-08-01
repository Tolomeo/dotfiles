package common;

class Json {
	public static function decode(str: String) {
		return Vim.json.decode(str, Table.create());
	}

	public static function encode(obj: Any) {
		return Vim.json.encode(obj, Table.create());
	}

	public static function format(str:String):String {
        var level = 0;
        var out = new StringBuf();
        var dquote = 0;

        for (i in 0...str.length) {
            var c = str.charAt(i);

            if (c == '{' || c == '[') {
                out.add(c);
                out.add('\n');
                level++;
                for (j in 0...level) out.add('  '); 
            }
            else if (c == '}' || c == ']') {
                level--;
                out.add('\n');
                for (j in 0...level) out.add('  ');
                out.add(c);
            }
            else if (c == ',') {
                out.add(c);
                out.add('\n');
                for (j in 0...level) out.add('  ');
            }
            else if (c == ':') {
                if (dquote % 2 == 1) {
                    out.add(':');
                } else {
                    out.add(': ');
                }
            }
            else if (c == '"') {
                dquote++;
                out.add('"');
            }
            else {
                out.add(c);
            }
        }

        return out.toString();
    }
}
