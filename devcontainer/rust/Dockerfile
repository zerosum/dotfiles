FROM z3r05um/devcontainer-base:latest

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --no-modify-path --default-toolchain=1.42.0 \
 && /root/.cargo/bin/rustup component add rls rust-analysis rust-src

ADD ./.zshrc /root/.zshrc
