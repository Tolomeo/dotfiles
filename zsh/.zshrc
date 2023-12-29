# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias ls='eza --long --all --smart-group --git --git-repos-no-status --color=always | less -RF'
alias lsf='eza --long --all --smart-group --git --git-repos-no-status --color=always --only-files | less -RF'
alias lsd='eza --long --all --smart-group --git --git-repos-no-status --color=always --only-dirs | less -RF'
alias lsa='eza --long --all --smart-group --git --git-repos-no-status --color=always  --tree | less -RF'
alias lsl='eza --long --all --smart-group --git --git-repos-no-status --color=always --header --group-directories-first --octal-permissions --modified --mounts --total-size --accessed --created --changed | less -RF'

# Pure prompt
# https://github.com/sindresorhus/pure
fpath+=($HOME/.dotfiles/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
