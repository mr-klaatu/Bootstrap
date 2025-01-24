#!/bin/zsh

# Create a symlink named current that points to the main groovy directory (e.g. /usr/share/groovy/groovy-2.1.6). The symlink could be located in the same directory that holds the groovy-x.y.z directory. This approach has the advantages of avoiding invalid characters in PATH and it can be redirected to a new version of groovy after an upgrade. Here is an example that assumes groovy is installed in /usr/share/groovy/ and groovy version 2.1.6.
#
# sudo ln -s /usr/share/groovy/groovy-2.1.6 current
# Use the new symlink to define the GROOVY_HOME variable in the login script (e.g. .profile):
#
# export GROOVY_HOME=/usr/share/groovy/current
# Add GROOVY_HOME/bin to the PATH variable in the login script:
#
# export PATH=$GROOVY_HOME/bin:$PATH
# NOTE: It's best to log out and log in before testing to ensure the initialization script sets the environment variables properly
#
# Test by executing groovy -v