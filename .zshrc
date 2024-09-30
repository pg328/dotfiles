export ZSH="$HOME/.oh-my-zsh"


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.local/bin:$PATH


plugin=(
  git
  )


# Specify a display so X works in zsh
# export DISPLAY=":0"
#
export EDITOR='nvim'

# Aliases
alias ls="exa --across --sort=.name --icons"
alias la="exa --across --all --sort=.name --icons"
alias ll="exa --long --grid --tree --level=1 --all --sort=.name --icons"
alias ll2="exa --long --grid --tree --level=2 --all --sort=.name --icons"
alias less="bat"
alias cat="bat"
alias vim="nvim"
alias vi="nvim"
alias spc="du -ah --block-size=G --max-depth=1 | bat"
alias zrc="nvim ~/.zshrc"
alias lg="lazygit"
alias htop="btop"
alias top="btop"
alias soz="source ~/.zshrc"
alias killwindows="sudo virsh shutdown win10"
alias grep="rg -i"
alias ping="prettyping"

HISTFILE=~/.zsh_history
HISTSIZE=10000
setopt appendhistory
bindkey -v
bindkey '^r' history-incremental-search-backward

# Set keyboard layout for xmonad
# setxkbmap         \
#   -layout gb      \
#   -option caps:ctrl    \
#   -option shift:both_capslock  \
#   -option ctrl:swap_lalt_lctl_lwin  
#
# Font used:
#   NV Script font
# Other considered fonts:
#   doh font
#   Broadway font


source $ZSH/oh-my-zsh.sh

clear;
echo <<- INTRO

 █     █░   ▓█████     ██▓        ▄████▄      ▒█████      ███▄ ▄███▓   ▓█████ 
▓█░ █ ░█░   ▓█   ▀    ▓██▒       ▒██▀ ▀█     ▒██▒  ██▒   ▓██▒▀█▀ ██▒   ▓█   ▀ 
▒█░ █ ░█    ▒███      ▒██░       ▒▓█    ▄    ▒██░  ██▒   ▓██    ▓██░   ▒███   
░█░ █ ░█    ▒▓█  ▄    ▒██░       ▒▓▓▄ ▄██▒   ▒██   ██░   ▒██    ▒██    ▒▓█  ▄ 
░░██▒██▓    ░▒████▒   ░██████▒   ▒ ▓███▀ ░   ░ ████▓▒░   ▒██▒   ░██▒   ░▒████▒
░ ▓░▒ ▒     ░░ ▒░ ░   ░ ▒░▓  ░   ░ ░▒ ▒  ░   ░ ▒░▒░▒░    ░ ▒░   ░  ░   ░░ ▒░ ░
  ▒ ░ ░      ░ ░  ░   ░ ░ ▒  ░     ░  ▒        ░ ▒ ▒░    ░  ░      ░    ░ ░  ░
  ░   ░        ░        ░ ░      ░           ░ ░ ░ ▒     ░      ░         ░   
    ░          ░  ░       ░  ░   ░ ░             ░ ░            ░         ░  ░
                                 ░                                            
▄▄▄█████▓ ▒█████                                                              
▓  ██▒ ▓▒▒██▒  ██▒                                                            
▒ ▓██░ ▒░▒██░  ██▒                                                            
░ ▓██▓ ░ ▒██   ██░                                                            
  ▒██▒ ░ ░ ████▓▒░                                                            
  ▒ ░░   ░ ▒░▒░▒░                                                             
    ░      ░ ▒ ▒░                                                             
  ░      ░ ░ ░ ▒                                                              
             ░ ░                                                              
                                                                              
  █████▒ ▒█████   ██▀███    ▄████ ▓█████     ▒█████    ██████                 
▓██   ▒ ▒██▒  ██▒▓██ ▒ ██▒ ██▒ ▀█▒▓█   ▀    ▒██▒  ██▒▒██    ▒                 
▒████ ░ ▒██░  ██▒▓██ ░▄█ ▒▒██░▄▄▄░▒███      ▒██░  ██▒░ ▓██▄                   
░▓█▒  ░ ▒██   ██░▒██▀▀█▄  ░▓█  ██▓▒▓█  ▄    ▒██   ██░  ▒   ██▒                
░▒█░    ░ ████▓▒░░██▓ ▒██▒░▒▓███▀▒░▒████▒   ░ ████▓▒░▒██████▒▒                
 ▒ ░    ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░ ░▒   ▒ ░░ ▒░ ░   ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░                
 ░        ░ ▒ ▒░   ░▒ ░ ▒░  ░   ░  ░ ░  ░     ░ ▒ ▒░ ░ ░▒  ░ ░                
 ░ ░    ░ ░ ░ ▒    ░░   ░ ░ ░   ░    ░      ░ ░ ░ ▒  ░  ░  ░                  
            ░ ░     ░           ░    ░  ░       ░ ░        ░                  
                                                                              

INTRO

# clear; cowsay "Welcome to Forge OS";


_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# bun completions
[ -s "/home/phil/.bun/_bun" ] && source "/home/phil/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(oh-my-posh init zsh --config /home/phil/.config/oh-my-posh/omp.toml)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
