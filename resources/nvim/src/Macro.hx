import Settings;
import common.Mode;

typedef Plugins = Array<Any>;
typedef Modules = Array<String>;
typedef Setup = () -> Void;

@:keepSub
class Module<Config> {
	final id: String;
	final modules:Modules;
	final plugins:Plugins;

	function new(id: String, modules:Modules, plugins:Plugins) {
		this.id = id;
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

	function getConfig():Config {
		return Reflect.getProperty(Settings.get().config, this.id);
	}

	function setConfig(config: Config) {
		return Settings.get().saveConfig(this.id, config);
	}
}

typedef MacroConfig = {
	escapeCharacters: Table<Int, String>,
	saved: Table<String, String>,
}

@:keep
@:expose("macro")
class Macro extends Module<MacroConfig> {
	public function new() {
		super("macro", [], []);
	}

	function yank() {
		final registerName = Vim.fn.input('Please specify a register to yank from: ');

		Vim.api.nvim_echo([], false, {});

		Vim.schedule(() -> {
			if (registerName == "") {
				Vim.notify('Invalid register name', Vim.log.levels.ERROR);
				return null;
			}

			this.yankRegister(registerName);
		});
	}

	function yankRegister(registerName:String) {
		final registerContent = Vim.fn.getreg(registerName);

		if (registerContent == "") {
			Vim.notify('Invalid register content', Vim.log.levels.ERROR);
			return null;
		}

		final escapeCharacters = this.getConfig().escapeCharacters;
		final macroContent = Table.toArray(escapeCharacters).fold((character:String, content:String) -> {
			return content.replace(character, '\\${character}');
		}, Vim.fn.keytrans(registerContent));

		Vim.fn.setreg('+', macroContent);
		Vim.fn.setreg('*', macroContent);
		Vim.fn.setreg('"', macroContent);

		Vim.notify('Yanked macro content from register ${registerName}', Vim.log.levels.INFO);
		return null;
	}

	function save() {
		final register = Vim.fn.input('Please specify a register to save: ');
		final label = Vim.fn.input('Please specify a label to use: ');

		Vim.api.nvim_echo([], false, {});

		Vim.schedule(() -> {
			if (register == "") {
				Vim.notify('Invalid register name', Vim.log.levels.ERROR);
				return null;
			}

			this.saveRegister(register, label);
		});
	}

	function saveRegister(register: String, label: String) {
		final registerContent = Vim.fn.getreg(register);

		if (registerContent == "") {
			Vim.notify('Invalid register content', Vim.log.levels.ERROR);
			return null;
		}

		final config = this.getConfig();
		Reflect.setProperty(config.saved, label, registerContent);
		this.setConfig(config);

		return null;
	}

	function run() {
		final mcros = this.getConfig().saved;
		final labels = Reflect.fields(mcros);

		Vim.ui.select(labels, Table.create(), (?label: Null<String>, ?idx: Null<Int>) -> {
			if (label == null) {
				return null;
			}

			final mcro = Reflect.getProperty(mcros, label);

			return this.runMacro(mcro);
		});
	}

	function runMacro(mcro: String) {
		(Vim.cmd: (command:haxe.extern.EitherType<String, lua.Table.AnyTable>) -> Dynamic)(Table.create(null, {
			cmd: "normal",
			args: Table.create([Vim.api.nvim_replace_termcodes(mcro, true, true, true)])
		}));
		Mode.ensureNormal();
		return null;
	}

	override public function setup() {
		Vim.api.nvim_create_user_command("YankMacro", (args:nvim.type.vim.api.keyset.create_user_command.CommandArgs) -> switch (Table.toArray(args.fargs)) {
			case []: this.yank();
			case [r]: this.yankRegister(r);
			case arguments:
				Vim.notify('Error yanking macro: invalid number of arguments received ${arguments}, expected 1 argument <register>', Vim.log.levels.ERROR);
		}, {nargs: "*"});

		Vim.api.nvim_create_user_command("SaveMacro", (args:nvim.type.vim.api.keyset.create_user_command.CommandArgs) -> switch (Table.toArray(args.fargs)) {
			case []: this.save();
			case [r, l]: this.saveRegister(r, l);
			case arguments:
				Vim.notify('Error saving macro: invalid number of arguments received ${arguments}, expected 2 arguments <register> <label>', Vim.log.levels.ERROR);
		}, {nargs: "*"});

		Vim.api.nvim_create_user_command("RunMacro", (args:nvim.type.vim.api.keyset.create_user_command.CommandArgs) -> switch (Table.toArray(args.fargs)) {
			case []: this.run();
			// case [m]: this.runMacro(m);
			case arguments:
				Vim.notify('Error saving macro: invalid number of arguments received ${arguments}, expected 1 argument only <label>', Vim.log.levels.ERROR);
		}, {nargs: "*"});

		// final parents = Vim.fs.parents(".");

		// Vim.print(parents._0());
		/* Vim.print(parents.get__1());
			Vim.print(parents.get__2()); */
	}
}
