eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -d ${HOME}/.oh-my-zsh ]; then
  if [ ! -d ${HOME}/.oh-my-zsh/cache ]; then
      mkdir ${HOME}/.oh-my-zsh/cache
  fi
  export ZSH_COMPDUMP=${HOME}/.oh-my-zsh/cache/.zcompdump-$HOST
fi

