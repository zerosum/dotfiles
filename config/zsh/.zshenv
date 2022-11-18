### locale ###
export LANG="en_US.UTF-8"

### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

### starship ###
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

### asdf ###
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

### Haskell ###
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GHCUP_USE_XDG_DIRS=1

### navi ###
export NAVI_CONFIG="$XDG_CONFIG_HOME"/navi/config.yaml
