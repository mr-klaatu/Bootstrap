# Default Shell script for non-homebrew installs.

unset BREW

if [ `uname -p | grep -i arm` ] 
then
	export Architecture=Arm
  export ARCHFLAGS="-arch arm64"
else
	export Architecture=Intel
  export ARCHFLAGS="-arch x86_64"
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
  if [ -f ~/.aliasrc ]
  then
    source ~/.aliasrc
    echo "Aliases Initialised"
  fi

  # Setup golang
  if [ -f ~/.gorc ]
  then
    source ~/.gorc
    echo "GO Initialised"
  fi

  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
  else
    export EDITOR='vi'
  fi

fi


