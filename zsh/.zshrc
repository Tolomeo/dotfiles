# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias cat='bat --paging=never'

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

# Pure prompt
# https://github.com/sindresorhus/pure
fpath+=($HOME/.dotfiles/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
