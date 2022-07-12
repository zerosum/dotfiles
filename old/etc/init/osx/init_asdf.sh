#!/bin/bash

asdf plugin add java
asdf plugin add nodejs
asdf plugin update --all

global_java_version=temurin-8.0.322+6

# https://github.com/halcyon/asdf-java#apple-silicon-integration
arch -x86_64 asdf install java $global_java_version
asdf global java $global_java_version

global_nodejs_version=16.14.2

asdf install nodejs $global_nodejs_version
asdf global nodejs $global_nodejs_version
