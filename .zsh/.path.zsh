typeset -U path PATH
export PATH="$(echo $(brew --prefix))/bin:/usr/local/bin:$PATH"
