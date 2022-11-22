.PHONY: base
base:
	docker buildx create --use \
	&& docker buildx build --push --platform linux/amd64,linux/arm64 --tag "z3r05um/devcontainer-base:latest" ./base
