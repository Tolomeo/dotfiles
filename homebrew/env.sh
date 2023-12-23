if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export NVM_DIR="$HOME/.nvm"

if [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ]; then
	. "$(brew --prefix)/opt/nvm/nvm.sh"
fi
# if [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ]; then
# 	. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
# fi
