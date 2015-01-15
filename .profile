# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

JAVA_HOME=/home/daniel/software/jdk1.7.0_45
SDK_HOME=/home/daniel/software/android_SDK/tools
SDK_tools_HOME=/home/daniel/software/android_SDK/platform-tools
ANDROID_NDK_HOME=/home/daniel/software/android-ndk-r10d
#NVM_DIR=/home/daniel/.nvm
NODE_DIR=/usr/bin/node
export PATH=$JAVA_HOME/bin:$SDK_HOME:$SDK_tools_HOME:$ANDROID_NDK_HOME:$NODE_DIR:$PATH

#nvm use v0.11.14	

