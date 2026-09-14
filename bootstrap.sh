#!/usr/bin/env sh

# Locate the repository, whether this script is executed or sourced.
script_dir="$(dirname "$0")"
if [ -d "$script_dir/home" ]; then
	cd "$script_dir" || exit 1
fi

if [ ! -d "./home" ]; then
	echo "❌  Could not find the home/ directory. Run this from your dotfiles clone." >&2
	return 1 2>/dev/null || exit 1
fi

# Symlink everything in `home/` into the home directory, so that the repository
# stays the single source of truth and local edits cannot silently drift.
linkIt() {
	git pull origin main

	src_dir="$(pwd)/home"
	backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%dT%H%M%S)"

	for src in "$src_dir"/.[!.]*; do
		# Guard against the glob not matching anything.
		[ -e "$src" ] || continue

		name="${src##*/}"
		dest="$HOME/$name"

		# Nothing to do when the symlink already points at the repository.
		if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
			continue
		fi

		# Keep whatever is there already; those files may hold local edits.
		if [ -e "$dest" ] || [ -L "$dest" ]; then
			mkdir -p "$backup_dir"
			mv "$dest" "$backup_dir/$name"
			echo "📦  Backed up ~/$name"
		fi

		ln -s "$src" "$dest"
		echo "🔗  Linked ~/$name"
	done

	if [ -d "$backup_dir" ]; then
		echo "💾  Replaced files were moved to $backup_dir."
	fi
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	linkIt
else
	# Homebrew
	printf "🍺  Install Homebrew and its formulae? (y/N) "
	read -r runswitch
	case "$runswitch" in
		y|Y|yes|YES) . init/brew/install-brew-formulae.sh ;;
		*) echo "Skipping Homebrew." ;;
	esac

	# dotfiles
	printf "🚨  Installing dotfiles. This will replace matching files in your home directory with symlinks. Are you sure? (y/N) "
	read -r runswitch
	case "$runswitch" in
		y|Y|yes|YES) linkIt ;;
		*) echo "Skipping installation." ;;
	esac

	# zsh
	printf "🙃  Install ohmyzsh and some plugins? (y/N) "
	read -r runswitch
	case "$runswitch" in
		y|Y|yes|YES) . init/terminal/install-zsh.sh ;;
		*) echo "Skipping ohmyzsh." ;;
	esac

	# Node modules
	printf "🟨  Install Node modules? (y/N) "
	read -r runswitch
	case "$runswitch" in
		y|Y|yes|YES) . init/npm/install-node-modules.sh ;;
		*) echo "Skipping Node modules." ;;
	esac
fi

unset -f linkIt
