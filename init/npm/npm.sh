#!/bin/sh

# Update npm itself.
npm update -g npm

# Install build tools.
npm install -g gulp-cli
npm install -g grunt-cli

# Install bootstrappers.
npm install -g create-react-app
npm install -g gatsby-cli

# Install linters.
npm install -g eslint
npm install -g stylelint
npm install -g xo

# Install analysis tools.
npm install -g specificity-graph
npm install -g speed-test
npm install -g stylestats
npm install -g psi
npm install -g tmi
npm install -g hint
npm install -g plato

# Install server development packages.
npm install -g local-web-server
npm install -g supervisor
npm install -g easymock

# Install funsies.
npm install -g youtube-thumbnail
