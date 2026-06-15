set -g fish_greeting
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

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"

set -Ux HF_HOME /mnt/storage/ai-cache
set -Ux HF_HUB_CACHE /mnt/storage/ai-cache/hub

# if status --is-login
#     if test -z "$DISPLAY"
#         and test (tty) = /dev/tty1
#         exec startx
#     end
# end
