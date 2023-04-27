# Only run this is an interactive shell...
#
if [[ -o interactive ]]
then

  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.
  #
  # Example aliases
  alias zshconfig="vi ~/.zshrc"
  alias zshrc="vi ~/.zshrc"
  alias developer="cd ~/Developer"
  alias botstrap="cd ~/Developer/Bootstrap"
  alias sites="cd ~/Sites"
  alias src="cd $GOPATH/src"
  if [[ -n $BREW ]]
  then  
    alias vi="nvim"
  fi
fi
