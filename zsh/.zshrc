# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias cat='bat --paging=never'

# better ls
function ls {
  eza --long --all --smart-group --git --git-repos-no-status --color=always --icons=always "$@" | less -RF
}

function lsf {
	eza --long --all --smart-group --git --git-repos-no-status  --color=always --icons=always --only-files "$@" | less -RF
}

function lsd {
	eza --long --all --smart-group --git --git-repos-no-status --color=always --icons=always --only-dirs "$@" | less -RF
}

function lsa {
	eza --long --all --smart-group --git --git-repos-no-status --color=always --icons=always --tree "$@" | less -RF
}

function lsl {
	eza --long --all --smart-group --git --git-repos-no-status --color=always --icons=always --header --group-directories-first --octal-permissions --modified --mounts --total-size --accessed --created --changed "$@" | less -RF
}

# handling multiple nvim configurations
function nvims ()
{
	nvim_configs=("nvim")
	nvim_config=$(printf "%s\n" "${nvim_configs[@]}" | fzf --prompt "Neovim config > " --height=~50% --layout=reverse --exit-0)

	if [[ -z $nvim_config ]]; then
		return 0
	fi

	NVIM_APPNAME=$nvim_config nvim $@
}

# Enables tab-completion in all npm commands
# https://docs.npmjs.com/cli/v10/commands/npm-completion
# https://github.com/nvm-sh/nvm/issues/427#issuecomment-632085191
# TODO: re-source when the user switches to a different version of node
source $NVM_BIN/../lib/node_modules/npm/lib/utils/completion.sh

# Fish-like autosuggestions for zsh
# https://github.com/zsh-users/zsh-autosuggestions
source $HOME/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pure prompt
# https://github.com/sindresorhus/pure
fpath+=($HOME/.dotfiles/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -s "$HOME/.zshrc_local" ]; then
	source "$HOME/.zshrc_local"
fi
