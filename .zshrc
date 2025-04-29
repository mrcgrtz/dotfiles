#!/usr/bin/env zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  1password
  alias-tips
  autoupdate
  colored-man-pages
  fnm
  fzf-zsh-plugin
  git
  gpg-agent
  rvm
  zoxide
  zsh-autosuggestions
  zsh-completions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

# Enable agent forwarding (required for Docker for Mac)
# zstyle :omz:plugins:ssh-agent agent-forwarding on

# Load Oh My Zsh.
builtin source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for any other setting you do not want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && builtin source "$file"
done;
unset file;

# Enable `fnm` (Fast Node Manager) if available.
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Enable rvm.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && builtin source "$HOME/.rvm/scripts/rvm"

# Enable the Pure prompt.
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit && promptinit
prompt pure
zstyle :prompt:pure:path color 'cyan'
zstyle :prompt:pure:git:stash show yes

# Enable iTerm2 shell integration.
[[ -f "$HOME/.item2_shell_integration.zsh" ]] && builtin source "$HOME/.item2_shell_integration.zsh"

# Enable Docker CLI completions.
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=($HOME/.docker/completions $fpath)
  autoload -Uz compinit
  compinit
fi