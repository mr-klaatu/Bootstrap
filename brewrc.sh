export HOMEBREW_NO_INSTALL_CLEANUP=1

#Validate HomeBrew Environment
if [ "${Architecture}" = "Arm" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"  
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

