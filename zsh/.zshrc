# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias ls='eza --long --smart-group --git --git-repos-no-status'
alias lsa='eza --long --smart-group --git --git-repos-no-status --all'
alias lsd='eza --long --smart-group --git --git-repos-no-status --only-dirs'
alias tree='eza --long --smart-group --git --git-repos-no-status --tree --color=always | less -R'

# Pure prompt
# https://github.com/sindresorhus/pure
fpath+=($HOME/.dotfiles/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
