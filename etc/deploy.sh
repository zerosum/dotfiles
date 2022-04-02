#!/opt/homebrew/bin/zsh

DOTPATH=~/.dotfiles
WORKING_DIR=$(cd $(dirname $0); pwd)

cd $DOTPATH

### deploy dotfiles
for f in .??*
do
  [[ "$f" = ".git" ]] && continue
  [[ "$f" = ".DS_Store" ]] && continue
  [[ "$f" = ".gitconfig.local" ]] && continue

  unlink "$HOME"/"$f"
  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
ln -snfv "$DOTPATH"/_gitignore "$HOME"/.gitignore
if [[ ! -e "$HOME/.gitconfig.local" ]]; then
  ln -snfv "$DOTPATH"/.gitconfig.local "$HOME"/.gitconfig.local
fi

### deploy prompts
ZPREZTODIR="${ZDOTDIR:-$HOME}/.zprezto"

if [ -e $ZPREZTODIR ]; then
  git -C $ZPREZTODIR reset --hard HEAD
  git -C $ZPREZTODIR pull
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $ZPREZTODIR
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -snfv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo 'zstyle :prezto:module:prompt theme powerlevel10k' >> ~/.zpreztorc
echo '[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' >> ~/.zshrc

### deploy zsh scripts
for zshfile in $(find ~/.zsh/ -name '*.zsh' -type f)
do
  echo "[[ -f $zshfile ]] && source $zshfile" >> ~/.zshrc
done

### setup others
[[ ! -z $(brew list openssh 2>/dev/null) ]] && echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc

### install git-secrets
git secrets --install -f ~/.git-templates/git-secrets

### apply
exec $(command -v zsh) -l
