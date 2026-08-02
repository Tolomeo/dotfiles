package common;

class Json {
	public static function decode(str:String) {
		return Vim.json.decode(str, Table.create());
	}

	public static function encode(obj:Any) {
		return Vim.json.encode(obj, Table.create());
	}

	// TODO: Better json format implementation?
	public static function format(str:String):String {
		final out = new StringBuf();
		var level = 0;
		var dquote = 0;

		for (i in 0...str.length) {
			final c = str.charAt(i);

			if (dquote % 2 == 1) {
				if (c == '"' && str.charAt(i - 1) != "\\") {
					dquote++;
				}

				out.add(c);
				continue;
			}

			switch (c) {
				case "{", "[":
					level++;
					out.add(c);
					out.add('\n');
					for (j in 0...level)
						out.add('  ');
				case "}", "]":
					level--;
					out.add('\n');
					for (j in 0...level)
						out.add('  ');
					out.add(c);
				case ",":
					out.add(c);
					out.add('\n');
					for (j in 0...level)
						out.add('  ');
				case ":":
					out.add(c);
					out.add(" ");
				case '"':
					dquote++;
					out.add(c);
				case _:
					out.add(c);
			}
		}

		return out.toString();
	}
}
