# dotfiles

My homegrown dotfiles repository which in the meantime is VERY much inspired by the work of [Mathias Bynens](https://mths.be/dotfiles) and [Paul Irish](https://github.com/paulirish/dotfiles). If you really want your own dotfiles repository, fork one of these. They have awesome setups!

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you do not want or need. Do not blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/dotfiles`.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/dreamseer/dotfiles.git && cd dotfiles && source bootstrap.sh
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
cd; curl -#L https://github.com/dreamseer/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE.md,init}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git/GitHub credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Marc Görtz"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mail@marcgoertz.de"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
GITHUB_USER_NAME="Dreamseer"
git config --global github.user "$GITHUB_USER_NAME"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/dreamseer/dotfiles/fork) instead, though.

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common Homebrew formulae (after installing [Homebrew](https://brew.sh/), of course):

```bash
source ./init/brew/brew.sh
```

#### Installed software via Homebrew

 * GNU core utilities
 * bash (latest version)
 * [bash-completion](https://github.com/scop/bash-completion/)
 * [git](https://git-scm.com/) and [git-extras](https://github.com/tj/git-extras/blob/master/Commands.md)
 * [The Silver Searcher](https://geoff.greer.fm/ag/)
 * [httpie](https://httpie.org/) (the better cURL)
 * [tree](http://mama.indstate.edu/users/ice/tree/)
 * [The Fuck](https://github.com/nvbn/thefuck)
 * [lynx](http://lynx.invisible-island.net/) (because I ♥ lynx)
 * Some more stuff, especially more recent versions of some macOS tools.

## My favorite parts

### [`.aliases`](https://github.com/dreamseer/dotfiles/blob/master/.aliases) and [`.functions`](https://github.com/dreamseer/dotfiles/blob/master/.functions)

There are so many goodies!

### The “readline config” (`.inputrc`)

Basically it makes typing into the prompt amazing:

 * Tab like crazy for autocompletion that does not suck. Tab all the things. Srsly.
 * No more `<tab><tab>` that says ”Display all 1337 possibilities? (y or n)”. Yay!
 * Type `cat <uparrow>` to see your previous `cat`s and use them.
 * Case insensitivity.
 * Tab all the livelong day.

### Moving around in folders (`z`, `...`, `cdf`)

`z` helps you jump around to whatever folder. It uses actual real magic to determine where you should jump to. Separately there’s some `...` aliases to shorten `cd ../..` and `..`, `....` etc. Then, if you have a folder open in Finder, `cdf` will bring you to it.

```sh
z dotfiles
z blog
....      # drop back equivalent to cd ../../..
z public
cdf       # cd to whatever’s up in Finder
```

`z` learns only once its installed so you’ll have to `cd` around for a bit to get it taught.

Lastly, I use `o` to open Finder from this path. (That's just available normally as `open .`.)

## Custom bash prompt

I use a custom bash prompt based on the [Nord](https://github.com/arcticicestudio/nord) color palette and influenced by [@gf3](https://github.com/gf3/dotfiles)’s and [@cowboy](https://github.com/cowboy/dotfiles)’s custom prompts.

When your current working directory is a Git repository, the prompt will display the checked-out branch’s name (and failing that, the commit SHA that HEAD is pointing to). The state of the working tree is reflected in the following way:

<table>
    <tr>
        <td><code>+</code></td>
        <td>Uncommitted changes in the index</td>
    </tr>
    <tr>
        <td><code>!</code></td>
        <td>Unstaged changes</td>
    </tr>
    <tr>
        <td><code>?</code></td>
        <td>Untracked files</td>
    </tr>
    <tr>
        <td><code>⚑</code></td>
        <td>Stashed files</td>
    </tr>
</table>

Further details are in the `.bash_prompt` file.

Screenshot:

<a href="https://cl.ly/jzRu"><img src="https://cl.ly/jzRu/Terminal.png" alt="Screenshot of my Bash promt." width="888" title="Colorful bash prompt and stuff."></a>

## Feedback

You’re quite [welcome](https://github.com/dreamseer/dotfiles/issues) to make suggestions or improvements, however I may decline if it’s not of personal value to me.

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

MIT © [Marc Görtz](https://marcgoertz.de/)
