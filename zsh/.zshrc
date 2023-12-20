# aliases are placed on top to be picked up by autocompletion
alias reload='source ~/.zshrc'
alias ll='ls -l'
alias la='ls -la'

# Loading NVM only if we are not in VSCode
# see https://stackoverflow.com/questions/66162058/vscode-complains-that-resolving-my-environment-takes-too-long
if [[ "x${TERM_PROGRAM}" = "xvscode" ]]; then
  echo 'in vscode, nvm doesn`t work; use `load-nvm`';
else
  load-nvm
fi

export VISUAL=nvim
export EDITOR=nvim
