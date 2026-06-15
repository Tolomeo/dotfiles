package nvim.type.vim.diagnostic;

extern enum abstract Severity(Float) from Float to Float {
	var WARN = "2";
	var W = "2";
	var N = "4";
	var INFO = "3";
	var I = "3";
	var HINT = "4";
	var ERROR = "1";
	var E = "1";
}