# 💬 OptiChoice

The [BASH](https://www.gnu.org/software/bash/manual/bash.html#What-is-Bash_003f) project allows for more interactivity with certain console tools, like [Git](https://git-scm.com/) and [NVM](https://github.com/nvm-sh/nvm).
The project also provides a toolset for easy extension.

## Installation

Put the package content in some of the `PATH` location.

The file `git_switch_branch.sh` has to be put inside the directory. But all other files (those without extensions) can be skipped. If you are not interested with particular command just do not install it.

## Use

After installation, you can use additional commands (unless omitted during [the installation process](#installation)).

## Commands

| Command               | Source command | The result command       |
|:----------------------|:---------------|:-------------------------|
| `git_switch_branch`   |`git branch`    |`git checkout $selection` |
| `nvm_select`          |`nvm list`      |`nvm use $selection`      |

### How to find the correct place

You can see the directories listed in the PATH:

```sh
echo $PATH
```

On Linux it maybe be usually `~/.local/bin`.

On Windows system you can also use the command:

```bat
echo %PATH%
```

but it will be better to open "Environment Variables" and then select "User".
