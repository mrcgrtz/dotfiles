#!/usr/bin/env sh

# Update npm itself.
npm update -g npm

# Enable corepack (thus yarn).
if ! command -v corepack > /dev/null 2>&1; then
  npm install -g corepack
fi;
corepack enable

# Install build tools.
npm install -g gulp-cli     # https://www.npmjs.com/package/gulp-cli

# Install performance analysis tools.
npm install -g speed-test   # https://www.npmjs.com/package/speed-test
npm install -g lighthouse   # https://www.npmjs.com/package/lighthouse

# Install linters and formatters for Sublime Text.
npm install -g eslint       # https://www.npmjs.com/package/eslint
npm install -g stylelint    # https://www.npmjs.com/package/stylelint
npm install -g prettier     # https://www.npmjs.com/package/prettier

# Install other useful utilities.
npm install -g npm-check    # https://www.npmjs.com/package/npm-check
