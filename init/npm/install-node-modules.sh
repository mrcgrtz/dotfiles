#!/usr/bin/env sh

# Update npm itself.
npm update -g npm

# Enable corepack (thus yarn).
if ! command -v corepack > /dev/null 2>&1; then
  npm install -g corepack
fi;
corepack enable

# Install build tools.
npm install -g gulp-cli
npm install -g grunt-cli

# Install performance analysis tools.
npm install -g speed-test
npm install -g psi

# Install other useful utilities.
npm install -g npm-check
