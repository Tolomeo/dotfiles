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
		final registerName = Vim.fn.input('Please specify a register to yank from: ');

		// Vim.api.nvim_echo([["g"]], false, {});
		Vim.api.nvim_echo([], false, {});

		Vim.schedule(() -> {
			if (registerName == "") {
				Vim.notify('Invalid register name', cast Vim.log.levels.ERROR);
				return null;
			}

			Macro.yankRegister(registerName);
		});
	}

	static function yankRegister(registerName:String) {
		final registerContent = Vim.fn.getreg(registerName);

		if (registerContent == "") {
			Vim.notify('Invalid register content', cast Vim.log.levels.ERROR);
			return null;
		}

		final macroContent = Macro.config.escapeCharacters.fold((character:String, content:String) -> {
			return content.replace(character, '\\${character}');
		}, Vim.fn.keytrans(registerContent));

		Vim.fn.setreg('+', macroContent);
		Vim.fn.setreg('*', macroContent);
		Vim.fn.setreg('"', macroContent);

		Vim.notify('Yanked macro content from register ${registerName}', cast Vim.log.levels.INFO);
		return null;
	}

	override public function setup() {
		Vim.api.nvim_create_user_command("YankMacro", (args:nvim.type.vim.api.keyset.create_user_command.CommandArgs) -> switch (args.fargs.toArray()) {
			case []: Macro.yank();
			case [r]: Macro.yankRegister(r);
			case arguments:
				Vim.notify('Error yanking macro: invalid number of arguments received ${arguments}, expected 1 argument only', cast Vim.log.levels.ERROR);
		}, {nargs: "*"});

		// final parents = Vim.fs.parents(".");

		// Vim.print(parents._0());
		/* Vim.print(parents.get__1());
			Vim.print(parents.get__2()); */
	}
}
