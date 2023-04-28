# Default Shell script for non-homebrew installs.

unset BREW
unset HOMEBREW_ROOT
unset HOMEBREW_PREFIX
unset HOMEBREW_CELLAR
unset HOMEBREW_REPOSITORY
unset MANPATH
unset INFOPATH
unset ZSH
unset ZSH_COMPDUMP
unset PATH

if [ `/usr/bin/uname -p | /usr/bin/grep -i arm` ] 
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
export PATH="${HOME}/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Various Environment Variables
export DUMP_VHOSTS=${HOME}/Sites/var/log
export DUMP_RUN_CFG=${HOME}/Sites/var/log 

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
    export EDITOR='vi'
  else
    export EDITOR='vi'
  fi

fi
echo "This machine is `/usr/bin/uname -n`, Running on $Architecture Architecture"
echo "Current default SHELL is ${SHELL} and the user is ${USER} in ${PWD}"

