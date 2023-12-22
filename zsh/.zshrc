# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias ll='ls -l'
alias la='ls -la'

# Pure prompt
# https://github.com/sindresorhus/pure
fpath+=($HOME/.dotfiles/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Zsh syntax highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
