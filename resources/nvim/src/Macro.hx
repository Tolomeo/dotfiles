typedef Plugins = Array<Any>;
typedef Modules = Array<String>;
typedef Setup = () -> Void;

@:keepSub
class Module {
	final modules:Modules;
	final plugins:Plugins;

	function new(modules:Modules, plugins:Plugins) {
		this.modules = modules;
		this.plugins = plugins;
	}

	public function init() {
		this.setup();
	}

	public function setup() {}

	public function list_plugins() {
		return this.plugins;
	}
}

@:keep
@:expose
class Macro extends Module {
	private static final config = {
		escapeCharacters: ["\"", "'"]
	}

	public function new() {
		super([], []);
	}

	static function yank() {
		final registerName = Fn.input('Please specify a register to yank from: ');

		Api.nvim_echo(Table.create(), false, {});

		Vim.schedule(() -> {
			if (registerName == "") {
				Vim.notify('Invalid register name', Levels.ERROR);
				return null;
			}

			Macro.yankRegister(registerName);
		});
	}

	static function yankRegister(registerName:String) {
		final registerContent = Fn.getreg(registerName);

		if (registerContent == "") {
			Vim.notify('Invalid register content', Levels.ERROR);
			return null;
		}

		final macroContent = Macro.config.escapeCharacters.fold((character:String, content:String) -> {
			return content.replace(character, '\\${character}');
		}, Fn.keytrans(registerContent));

		Fn.setreg('+', macroContent);
		Fn.setreg('*', macroContent);
		Fn.setreg('"', macroContent);

		Vim.notify('Yanked macro content from register ${registerName}', Levels.INFO);
		return null;
	}

	override public function setup() {
		Api.nvim_create_user_command("YankMacro", (args:nvim.type.vim.api.keyset.create_user_command.CommandArgs) -> switch (args.fargs.toArray()) {
			case []: Macro.yank();
			case [r]: Macro.yankRegister(r);
			case r:
				Vim.notify('Error yanking macro: invalid number of arguments received ${r}', Levels.ERROR);
		}, {nargs: "*"});
		/* Vim.keymap.set("n", "8", () -> {
			Api.nvim_echo(Table.create(), false, {});
		}); */
	}
}
