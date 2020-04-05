export MYENV="$MYENV -> mac"
################
###   brew   ###
################
# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
export PATH=$(brew --prefix curl)/bin:$PATH



#################
###   alias   ###
#################
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias pc='/usr/local/bin/proxychains4'



##############
###   go   ###
##############
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin
# source /Users/lcitschan/.gvm/scripts/gvm



###################
###   Android   ###
###################
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/
# export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
export ANDROID_JAVA_HOME=$JAVA_HOME
export PATH=${PATH}:~/development/flutter/bin

