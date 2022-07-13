case $OSTYPE in
    darwin*)
        source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
        source /opt/homebrew/opt/fzf/shell/completion.zsh
        ;;
    linux*)
        source /usr/share/doc/fzf/examples/key-bindings.zsh
        source /usr/share/doc/fzf/examples/completion.zsh
        ;;
esac

# common setting
export FZF_DEFAULT_OPTS='--height 20% --reverse --border --prompt="? "'
export FZF_ALT_C_OPTS="--select-1 --exit-0"
