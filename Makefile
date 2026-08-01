.PHONY: update upgrade-darwin upgrade-nixos check install bootstrap init-hardware-config

NIX_FLAGS = --extra-experimental-features 'nix-command flakes'

update:
	nix flake update $(NIX_FLAGS)

upgrade-darwin:
	nix build .#darwinConfigurations.$(HOST_NAME).system $(NIX_FLAGS)
	git add .
	sudo ./result/sw/bin/darwin-rebuild switch --flake ".#$(HOST_NAME)"

upgrade-nixos:
	sudo nixos-rebuild switch --flake .#$(HOST_NAME)

check:
	nix eval $(NIX_FLAGS) -f tests/mkLocalOverlay.nix
	nix flake check $(NIX_FLAGS)

install:
	sh ./setup/install.sh

bootstrap:
	sh ./setup/bootstrap.sh

init-hardware-config:
	cp /etc/nixos/hardware-configuration.nix ./system/nixos/hardware-configuration.nix
