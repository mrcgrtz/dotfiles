#!/usr/bin/env sh

# The oh-my-zsh installer runs in a shell of its own, so the $ZSH it exports
# never reaches this script. Resolve the paths the same way oh-my-zsh does.
ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Install oh-my-zsh. `--unattended` keeps the installer from running `chsh`
# (install-brew-formulae.sh already does that) and from replacing the current
# shell, which would abort the rest of the bootstrap.
if [ ! -d "$ZSH" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install a plugin, unless it is already there.
install_plugin() {
	plugin_dir="$ZSH_CUSTOM/plugins/$2"
	if [ -d "$plugin_dir" ]; then
		echo "✅  $2 is already installed."
	else
		git clone --depth 1 "$1" "$plugin_dir"
	fi
}

install_plugin https://github.com/djui/alias-tips.git alias-tips
install_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions
install_plugin https://github.com/zsh-users/zsh-completions zsh-completions
install_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
install_plugin https://github.com/unixorn/fzf-zsh-plugin.git fzf-zsh-plugin

unset -f install_plugin
