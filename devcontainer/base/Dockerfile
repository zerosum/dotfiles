FROM ubuntu:22.04

RUN apt update && apt upgrade -y \
 && apt install -y zsh curl git neovim gcc cmake \
 && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
 && ~/.fzf/install --all --key-bindings --completion --no-bash --no-zsh \
 && curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin \
 && curl -sS https://starship.rs/install.sh | sh -s -- -y -b ~/.local/bin

ADD ./.zshrc /root/.zshrc
ADD ./sheldon /root/.config/sheldon

WORKDIR "/root"
ENTRYPOINT [ "/usr/bin/zsh" ]
