package common;

class Mode {
	static function getCurrent() {
		return Vim.api.nvim_get_mode().mode.toLowerCase();
	}

	static function exitInsert() {
		Vim.api.nvim_feedkeys(Vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true);
	}

	static function exitVisual() {
		Vim.api.nvim_command('normal! ' + Vim.api.nvim_replace_termcodes('<Esc>', true, false, true));
	}

	static public function ensureNormal() {
		switch (Mode.getCurrent()) {
			case "i": Mode.exitInsert();
			case "v": Mode.exitVisual();
		}
	}
}
