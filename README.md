# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a stow package. The files inside each package are
laid out exactly as they should appear under `$HOME`.

## Packages

- `alacritty` -> `~/.config/alacritty/alacritty.toml`
- `fish` -> `~/.config/fish/...`
- `foot` -> `~/.config/foot/foot.ini`
- `i3` -> `~/.config/i3/config`
- `i3status` -> `~/.config/i3status/config`
- `tmux` -> `~/.config/tmux/tmux.conf`

## Requirements

Install GNU Stow before using this repo.

On Debian/Ubuntu:

```sh
sudo apt install stow
```

On Fedora:

```sh
sudo dnf install stow
```

On Arch:

```sh
sudo pacman -S stow
```

## Install

Clone this repo somewhere under your home directory, then run the helper script:

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./sync-to-home
```

The script runs `stow --restow` for each package and links the files into
`$HOME`.

To stow one package manually:

```sh
stow --dir "$HOME/dotfiles" --target "$HOME" --restow fish
```

## Update Existing Links

After editing files in this repo, rerun:

```sh
cd ~/dotfiles
./sync-to-home
```

This refreshes the symlinks without removing packages from the package list.

## Uninstall

To remove links for one package:

```sh
cd ~/dotfiles
stow --target "$HOME" --delete fish
```

To remove all packages currently handled by the helper script:

```sh
cd ~/dotfiles
for package in i3 i3status fish alacritty foot tmux; do
  stow --target "$HOME" --delete "$package"
done
```

## Add A New Package

Create a new top-level directory using the same path the file should have under
`$HOME`.

Example for `nvim`:

```sh
mkdir -p nvim/.config/nvim
mv ~/.config/nvim/init.lua nvim/.config/nvim/init.lua
stow --dir "$HOME/dotfiles" --target "$HOME" --restow nvim
```

If the package should be installed by `./sync-to-home`, add its top-level
directory name to the `packages` array in that script.

## Handling Conflicts

Stow will not overwrite real files that already exist in `$HOME`. If you see a
conflict, move the existing file out of the way first, then rerun the stow
command.

Example:

```sh
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.backup
cd ~/dotfiles
stow --target "$HOME" --restow fish
```

