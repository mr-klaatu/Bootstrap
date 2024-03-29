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

if [ -d ${HOMEBREW_ROOT} ]
then
  if [ -d ${HOMEBREW_ROOT}/bin ]
  then
      # We are running an enhanced Homebrew Environment... 
      export BREW="YES"
  fi
fi

if [[ "$BREW" == "YES" ]]
then
echo "================================================================"
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
    echo "================================================================"
  fi

  # Setup PATH to ccache (if its installed)
  if [ -d ${HOMEBREW_ROOT}/opt/ccache/libexec ]
  then
    export PATH="${HOMEBREW_ROOT}/opt/ccache/libexec:${PATH}"
    ##echo "-DEBUG- ${PATH} - zshrc-1"
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

  # Setup nvm (if its installed)
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

  # Setup Groovy (if its installed)
  if [ -f ${HOMEBREW_ROOT}/bin/groovy ]
  then  
    export PATH="${HOMEBREW_ROOT}/bin/groovy:${PATH}"
    echo "Groovy Initialised"
  fi

  # Setup GOLANG (if its installed)
  if [ -f ${HOMEBREW_ROOT}/opt/go/libexec ]
  then  
    export GOROOT=${HOMEBREW_ROOT}/opt/go/libexec
    export PATH=${PATH}:${GOPATH}/bin:${GOROOT}/bin
    echo "GOLANG Initialised"
  fi

  # Setup Composer (if its installed)
  if [ -f ${HOME}/.composer/vendor/bin ]
  then  
    export PATH="${HOME}/.composer/vendor/bin:${PATH}"
    echo "Composer Initialised"
  fi


else
  echo "================================================================"
  echo "Running a Standard OSX environemnt on ($Architecture) Architecture..."
  #
  # Stuff in here gets set only for standard installs.
  #

fi
  
#
# Stuff in here gets set for ALL installs.
#
#
# Location of developer scripts and utilities
export DEVENV=${HOME}/Developer

# Location of bootstrap scripts and utilities
export BOOTENV=${DEVENV}/Bootstrap

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

# Stuff for GEM
export GEM_HOME="$HOME/.gem"

# Only use this in an interactive shell...
#
if [[ -o interactive ]]
then

  # Only use these in an interactive shell running Standard OSX...
  #

  # Preferred editor 
  if [[ "$BREW" == "YES" ]] 
  then
      export EDITOR='vim'
      export VISUAL='vim'
  else
      export EDITOR='vi'
      export VISUAL='vi'
  fi
  
  # Setup aliases
  if [ -f ${HOME}/.aliasrc ]
  then
    source ${HOME}/.aliasrc
    echo "Aliases Initialised"
  fi

  # Manage command history...
  #
  echo "Setup Command History."
  HISTSIZE=5000
  HISTFILE=~/.zsh_history
  SAVEHIST=5000
  HISTDUP=erase
  setopt appendhistory
  setopt sharehistory
  setopt incappendhistory
  setopt hist_ignore_all_dups
  setopt hist_save_no_dups
  setopt hist_ignore_dups
  setopt hist_find_no_dups

  echo "================================================================"
  # Case insensitivity...
  #
  echo "Setup Case Insensitivity."
  autoload -U compinit && compinit
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

  # emacs Key bindings...
  #
  echo "Setup Key Bindings."
  bindkey -e

  # Nice Prompt...
  #
  echo "Setup Prompt."
  PROMPT="%F{33}%# %n@%m:%1~/ $ "
  echo "================================================================"
  echo "This machine is `/usr/bin/uname -n`, Running on $Architecture Architecture"
  echo "Current default SHELL is $(which zsh) at the version of $(zsh --version)"
  echo "The current user is ${USER} in ${PWD}"
  echo "... zshrc complete."
  echo "================================================================"

   # Only use this in an interactive shell running BREW...
  #
  if [[ -n $BREW ]]
  then  
    brew services list
    echo "================================================================"
    printf "\e[92m" && figlet -f standard "Welcome Master"
    neofetch
  fi
fi

# Syntax Highlighting...   +++ MUST be last entry in this script +++
#
source ${BOOTENV}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
