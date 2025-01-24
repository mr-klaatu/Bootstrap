if [ ! -d "${HOME}/.nvm" ]; then
 	logger "Creating NVM HOME" I
    mkdir ~/.nvm
fi

export NVM_DIR="$HOME/.nvm"
[ -s "${HOMEBREW_ROOT}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_ROOT}/opt/nvm/nvm.sh"  # Loads nvm
[ -s "${HOMEBREW_ROOT}/opt/nvm/etc/bash_completion.d/nvm" ] && \. "${HOMEBREW_ROOT}/opt/nvm/etc/bash_completion.d/nvm"  # Loads nvm bash_completion