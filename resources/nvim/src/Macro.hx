typedef Plugins = Array<Any>;
typedef Modules = Array<String>;
typedef Setup = () -> Void;

@:keepSub
class Module {
	final modules: Modules;
	final plugins: Plugins;

	function new(modules: Modules, plugins: Plugins) {
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

@:expose()
class Macro extends Module {
	public function new(){
		super([], []);
	}

	override public function setup() {}
}
