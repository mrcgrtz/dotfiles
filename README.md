# dotfiles

My homegrown dotfiles repository which in the meantime is VERY much inspired by the work of [Mathias Bynens](https://mths.be/dotfiles) and [Paul Irish](https://github.com/paulirish/dotfiles). If you really want your own dotfiles repository, fork one of these. They have awesome setups!

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you do not want or need. Do not blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/dotfiles`.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/mrcgrtz/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/mrcgrtz/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,LICENSE.md,init}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here is an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
#!/usr/bin/env sh

export PATH="/usr/local/bin:$PATH";
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you do not want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
#!/usr/bin/env sh

# Git/GitHub credentials
# https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables#_committing
# Not in the repository, to prevent people from accidentally committing under my name.
GIT_AUTHOR_NAME="Marc Görtz";
GIT_AUTHOR_EMAIL="mail@example.com";
GITHUB_USER_NAME="mrcgrtz";
git config --global user.name "$GIT_AUTHOR_NAME";
git config --global user.email "$GIT_AUTHOR_EMAIL";
git config --global github.user "$GITHUB_USER_NAME";
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It is probably better to [fork this repository](https://github.com/mrcgrtz/dotfiles/fork) instead, though.

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae:

```bash
source ./init/brew/install-brew-formulae.sh
```

This also installs Homebrew if it is not yet installed.

#### Installed software via Homebrew

* GNU core utilities
* [git](https://git-scm.com/) and [git-extras](https://github.com/tj/git-extras/blob/master/Commands.md)
* [The Silver Searcher](https://geoff.greer.fm/ag/)
* [fig](https://fig.io/), an IDE-style autocomplete for the terminal
* [curlie](https://curlie.io/), an awesome frontend for `curl`
* [tree](http://mama.indstate.edu/users/ice/tree/)
* [up](https://github.com/akavel/up) for instant live preview when piping stuff
* [The Fuck](https://github.com/nvbn/thefuck)
* [lynx](http://lynx.invisible-island.net/) because I ♥ lynx
* Some more stuff, especially more recent versions of some macOS tools.

If you want to install some native macOS apps, the script will ask you
for permission to installs apps using
[Cask](https://github.com/Homebrew/homebrew-cask) and
[mas](https://github.com/mas-cli/mas). The app setup is tailored for
myself, so just say no if you do not trust my guts.

## My favorite parts

### [`.aliases`](https://github.com/mrcgrtz/dotfiles/blob/main/.aliases) and [`.functions`](https://github.com/mrcgrtz/dotfiles/blob/main/.functions)

There are so many goodies!

### The “readline config” (`.inputrc`)

Basically it makes typing into the prompt amazing:

* Tab like crazy for autocompletion that does not suck. Tab all the things. Srsly.
* No more `<tab><tab>` that says ”Display all 1337 possibilities? (y or n)”. Yay!
* Type `cat <uparrow>` to see your previous `cat`s and use them.
* Case insensitivity.
* Tab all the livelong day.

### Moving around in folders (`z`, `...`, `cdf`)

`z` helps you jump around to whatever folder. It uses actual real magic to determine where you should jump to. Separately there is some `...` aliases to shorten `cd ../..` and `..`, `....` etc. Then, if you have a folder open in Finder, `cdf` will bring you to it.

```sh
z dotfiles
z blog
....      # drop back equivalent to cd ../../..
z public
cdf       # cd to whatever is up in Finder
```

`z` learns only once its installed so you will have to `cd` around for a bit to get it taught.

Lastly, I use `o` to open Finder from this path. (That is just available normally as `open .`.)

## The prompt

I use [Pure](https://github.com/sindresorhus/pure) for my zsh prompt with a [Dracula](https://draculatheme.com/) color palette.

### Screenshot

![Screenshot of my prompt](https://raw.githubusercontent.com/mrcgrtz/dotfiles/main/init/terminal/screenshot.png "Colorful prompt.")

#### The nerdy details

* Terminal emulator: [iTerm2](https://iterm2.com/) (its settings are [synced](https://github.com/mrcgrtz/dotfiles/blob/main/init/terminal/com.googlecode.iterm2.plist))
* Font: [Dank Mono](https://dank.sh/)
* Wallpaper: [Golden forest pathway](https://unsplash.com/photos/hvrpOmuMrAI)

## Feedback

You are quite [welcome](https://github.com/mrcgrtz/dotfiles/issues) to make suggestions or improvements, however I may decline if it is not of personal value to me.

## Acknowledgements

Inspiration and code was taken from many sources, including:

* [@mathiasbynens](https://github.com/mathiasbynens) (Mathias Bynens)
  [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [@paulirish](https://github.com/paulirish) (Paul Irish)
  [https://github.com/paulirish/dotfiles](https://github.com/paulirish/dotfiles)
* [@necolas](https://github.com/necolas) (Nicolas Gallagher)
  [https://github.com/necolas/dotfiles](https://github.com/necolas/dotfiles)
* [@gf3](https://github.com/gf3) (Gianni Chiappetta)
  [https://github.com/gf3/dotfiles](https://github.com/gf3/dotfiles)
* [@cowboy](https://github.com/cowboy) (Ben Alman)
  [https://github.com/cowboy/dotfiles](https://github.com/cowboy/dotfiles)
* [@alrra](https://github.com/alrra) (Cãtãlin Mariş)
  [https://github.com/alrra/dotfiles](https://github.com/alrra/dotfiles)

## License

My dotfiles are released into public domain under the Unlicense so you can do whatever you want with it. Fork! Copy! Adapt!
