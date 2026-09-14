#!/usr/bin/env sh

# Get the directory holding the Brewfile. $0 points at this script when it is
# executed, but at the calling shell when it is sourced, so fall back to the
# path relative to the repository root that bootstrap.sh runs from.
SCRIPT_DIR="$(dirname "$0")"
if [ ! -f "$SCRIPT_DIR/Brewfile" ]; then
	SCRIPT_DIR="init/brew"
fi
if [ ! -f "$SCRIPT_DIR/Brewfile" ]; then
	echo "❌  Could not find the Brewfile. Run this from your dotfiles clone." >&2
	return 1 2>/dev/null || exit 1
fi
SCRIPT_DIR="$(cd "$SCRIPT_DIR" && pwd)"

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
ln -sf "$(brew --prefix coreutils)/bin/gsha256sum" "$(brew --prefix)/bin/sha256sum"

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
