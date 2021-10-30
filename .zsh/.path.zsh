typeset -U path PATH
export PATH="/usr/local/bin:$HOME/Library/ApplicationSupport/Coursier/bin:$PATH"
export JAVA_HOME=$(cs java-home --jvm adopt:1.8.0-292)
