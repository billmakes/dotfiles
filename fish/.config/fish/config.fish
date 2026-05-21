set -gx COLORTERM truecolor
fish_add_path /usr/sbin /sbin
fish_add_path /home/bill/.local/bin
fish_add_path /home/bill/.local/share/bob/nvim-bin
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

fish_add_path ~/.dotnet
fish_add_path ~/zig
fish_add_path ~/bin
set -x DOTNET_ROOT ~/.dotnet

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
funcsave dotfiles
