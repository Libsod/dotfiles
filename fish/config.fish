set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

starship init fish | source

alias ll="exa -1 -l -a -g --icons --git"
alias llt="exa -1 -a --icons --tree --level=2 --git-ignore"
alias scf="source $HOME/.config/fish/config.fish"
alias la="ls -la"
alias bu="brew update && brew upgrade"
alias v="nvim"
alias vfsh="nvim $HOME/.config/fish/config.fish"
alias vstrshp="nvim $HOME/.config/starship.toml"
alias vwztrm="nvim $HOME/.wezterm.lua"
alias python="python3"
alias nvm="mv $HOME/.config/nvim/ $HOME/.config/backupnvim2/ && mv $HOME/.config/primenvim/ $HOME/.config/nvim/"
alias sshadd="ssh-add ~/.ssh/id_rsa"
alias sshg="ssh -T git@github.com"
alias cl="clear"
alias clnvim="rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim"
alias rmf="rm -rf"


set -x PATH "$HOME/.local/bin" $PATH
set -g STARSHIP_CONFIG ~/.config/starship/starship.toml
set -x HISTFILE ~/.config/fish/fish_history
