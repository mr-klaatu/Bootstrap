#!/bin/zsh

#  -----------------------------------------------------------------------------
#  Useful information about zsh behaviour...
#  -----------------------------------------------------------------------------
#  /etc/zshenv    # Read for every shell
#  ~/.zshenv      # Read for every shell except ones started with -f
#  /etc/zprofile  # Global config for login shells, read before zshrc
#  ~/.zprofile    # User config for login shells
#  /etc/zshrc     # Global config for interactive shells
#  ~/.zshrc       # User config for interactive shells
#  /etc/zlogin    # Global config for login shells, read after zshrc
#  ~/.zlogin      # User config for login shells
#  ~/.zlogout     # User config for login shells, read upon logout
#  /etc/zlogout   # Global config for login shells, read after user logout file
#  -----------------------------------------------------------------------------


unset BREW

if [ `uname -p | grep -i arm` ] 
then
	export Architecture=Arm
  export ARCHFLAGS="-arch arm64"
  export HOMEBREW_ROOT=/opt/homebrew
else
	export Architecture=Intel
  export ARCHFLAGS="-arch x86_64"
  export HOMEBREW_ROOT=/usr/local
fi

if [ -d ${HOMEBREW_ROOT}/bin ]
then
    # We are running an enhanced Homebrew Environment... 
    export BREW="YES"
fi

if [[ "$BREW" == "YES" ]]
then
  echo "Running a HOMEBREW environemnt on (${Architecture}) Architecture and HOMEBREW_ROOT of ${HOMEBREW_ROOT}..."
  #
  # All the code below runs using the capbilites of HOMEBREW addons.
  #
  
  # Brew configuration
  #
  if [ -f ${HOME}/.brewrc ]
  then
    source ${HOME}/.brewrc
    echo "Homebrew Initialised"
  fi

  
  # Set name of the theme to load --- if set to "random", it will
  # load a random theme each time oh-my-zsh is loaded, in which case,
  # to know which specific one was loaded, run: echo $RANDOM_THEME
  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  ZSH_THEME="robbyrussell"

  # Uncomment the following line to use case-sensitive completion.
  # CASE_SENSITIVE="true"

  # Uncomment the following line to use hyphen-insensitive completion.
  # Case-sensitive completion must be off. _ and - will be interchangeable.
  # HYPHEN_INSENSITIVE="true"

  # Uncomment one of the following lines to change the auto-update behavior
  # zstyle ':omz:update' mode disabled  # disable automatic updates
  # zstyle ':omz:update' mode auto      # update automatically without asking
  zstyle ':omz:update' mode reminder  # just remind me to update when it's time

  # Uncomment the following line to change how often to auto-update (in days).
  zstyle ':omz:update' frequency 13

  # Uncomment the following line if pasting URLs and other text is messed up.
  DISABLE_MAGIC_FUNCTIONS="true"

  # Uncomment the following line to disable colors in ls.
  # DISABLE_LS_COLORS="true"

  # Uncomment the following line to disable auto-setting terminal title.
  # DISABLE_AUTO_TITLE="true"

  # Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  # You can also set it to another string to have that shown instead of the default red dots.
  # e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
  # Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
  # COMPLETION_WAITING_DOTS="true"

  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  # DISABLE_UNTRACKED_FILES_DIRTY="true"

  # Uncomment the following line if you want to change the command execution time
  # stamp shown in the history command output.
  # You can set one of the optional three formats:
  # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  # or set a custom format using the strftime function format specifications,
  # see 'man strftime' for details.
  HIST_STAMPS="yyyy-mm-dd"

  # Which plugins would you like to load?
  # Standard plugins can be found in $ZSH/plugins/
  # Custom plugins may be added to $ZSH_CUSTOM/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
  plugins=(
   git
   zsh-syntax-highlighting
   zsh-autosuggestions
   zsh-completions
   sudo
  )

  # command for zsh-completions
  autoload -U compinit && compinit

  if [ -f ${HOME}/.oh-my-zsh/oh-my-zsh.sh ]
  then
    source ${HOME}/.oh-my-zsh/oh-my-zsh.sh
    echo "Oh-My_zsh Initialised"
  fi

  # Setup Ruby (if its installed)
  if (( $+commands[rbenv] ))
  then
    if [ -f ${HOME}/.rubyrc ]
    then
      rbenv init - > ~/.rubyrc
      echo "Ruby Initialised"
      source ${HOME}/.rubyrc
    fi
  fi

  # Setup nvm
  if (( $+commands[nvm] ))
  then
    if [ -f ${HOME}/.nvmrc ]
    then
      source ${HOME}/.nvmrc
      echo "NVM Initialised"
    fi
  fi

  # Setup jenv (if its installed)
  if (( $+commands[jenv] ))
  then
    if [ -f ${HOME}/.jenvrc ]
    then  
      jenv init - > ~/.jenvrc
      echo "JENV Initialised"
      source ${HOME}/.jenvrc
    fi
  fi    

  if [ -f ${HOME}/.composer/vendor/bin ]
  then  
    export PATH="${HOME}/.composer/vendor/bin:${PATH}"
    echo "Composer Initialised"
  fi


else
  echo "Running a Standard OSX environemnt on ($Architecture) Architecture..."
  #
  # Stuff in here gets set only for standard installs.
  #

fi
  
#
# Stuff in here gets set for ALL installs.
#
#
# Generic configuration goes in here...
export PATH="${HOME}/bin:${PATH}"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Various Environment Variables
export DUMP_VHOSTS=/Users/david/Sites/var/log
export DUMP_RUN_CFG=/Users/david/Sites/var/log 


# WinterCMS Variables
export APP_ENV=DEV

# Node.JS Variables
export NODE_ENV=development
#

# Only use this in an interactive shell...
#
if [[ -o interactive ]]
then


  # Only use the in an interactive shell running Standard OSX...
  #
  
  # Setup aliases
  if [ -f ${HOME}/.aliasrc ]
  then
    source ${HOME}/.aliasrc
    echo "Aliases Initialised"
  fi

  # Setup golang
  if [ -f ${HOME}/.gorc ]
  then
    source ${HOME}/.gorc
    echo "GO Initialised"
  fi

  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
  else
    export EDITOR='nvim'
  fi


  # Only use this in an interactive shell running BREW...
  #
  if [[ -n $BREW ]]
  then  
    printf "\e[92m" && figlet -f standard "Welcome Master"
    brew services list
    neofetch
  fi

fi
