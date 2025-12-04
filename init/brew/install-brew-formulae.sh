#!/usr/bin/env sh

# Get the directory where this script is located
# Use BASH_SOURCE for when script is sourced, fall back to $0
if [ -n "$BASH_SOURCE" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" && pwd)"
else
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

# Install Homebrew (you need the Xcode CLI tools!)
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Disable analytics.
brew analytics off

# Make sure we are using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install formulae from Brewfile.
brew bundle install --file="$SCRIPT_DIR/Brewfile"

# Use GNU tools like sha256sum.
echo "⚠️  Do not forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
ln -sf "$(brew --prefix coreutils)/bin/gsha256sum" /usr/local/bin/sha256sum

# Switch to using Brew-installed Zsh as default shell.
zsh_path="$(brew --prefix)/bin/zsh"
if ! grep -F "$zsh_path" /etc/shells >/dev/null 2>&1; then
  echo "$zsh_path" | sudo tee -a /etc/shells
  chsh -s "$zsh_path"
fi

# Maybe install formulae from Caskfile, too.
printf "📡  Also install native apps using Homebrew Casks and the Mac App Store? (y/N) "
read -r docask
case "$docask" in
  y|Y|yes|YES) brew bundle install --file="$SCRIPT_DIR/Caskfile" ;;
  *) echo "Skipping Caskfile." ;;
esac

# Remove outdated versions from the Cellar.
brew cleanup
