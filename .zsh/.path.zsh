typeset -U path PATH
export PATH="/usr/local/bin:$HOME/Library/Application Support/Coursier/bin:$PATH"
export JAVA_HOME=$(cs java-home --jvm adopt:1.11.0-11)
