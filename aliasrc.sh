# Only run this is an interactive shell...
#
if [[ -o interactive ]]
then

  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.
  #
  alias ls="ls -G"

  alias zshconfig="vim ${HOME}/.zshrc"
  alias zshrc="source ${HOME}/.zshrc"

  alias gosites="cd ${HOME}/Sites"
  alias godev="cd ${HOME}/Developer"
  alias goboot="cd ${HOME}/Developer/Bootstrap"
  alias gosrc="cd ${HOME}/Developer/GO/src/github.com/mr-klaatu"

  alias vi="${EDITOR}"
 
fi
