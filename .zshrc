export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.local/bin:~/.tmuxifier/bin:$PATH


plugin=(
  git
  )


# Specify a display so X works in zsh
# export DISPLAY=":0"
#
export EDITOR='nvim'
export TF_LOG=1

# Aliases
alias ls="exa --across --sort=.name --icons"
alias la="exa --across --all --sort=.name --icons"
alias ll="exa --long --grid --tree --level=1 --all --sort=.name --icons"
alias ll2="exa --long --grid --tree --level=2 --all --sort=.name --icons"
alias less="bat"
alias cat="bat"
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
alias homerc="vi ~/.config/home-manager/home.nix"
alias hypr_reset="source ~/bin/reset_hypr_socket"

export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"

source <(fzf --zsh)

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --preview 'tree -C {}'"

HISTFILE=~/.zsh_history
HISTSIZE=10000
setopt appendhistory
bindkey -v
bindkey '^r' history-incremental-search-backward


source $ZSH/oh-my-zsh.sh

clear

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


# _direnv_hook() {
#   trap -- '' SIGINT;
#   eval "$("/usr/bin/direnv" export zsh)";
#   trap - SIGINT;
# }
# typeset -ag precmd_functions;
# if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
#   precmd_functions=( _direnv_hook ${precmd_functions[@]} )
# fi
# typeset -ag chpwd_functions;
# if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
#   chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
# fi

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# bun completions
[ -s "/home/phil/.bun/_bun" ] && source "/home/phil/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export HISTTIMEFORMAT="%d/%m/%y %T "
# export LANGUAGE="en_GB.UTF-8"
# export LC_ALL="en_GB.UTF-8"

eval "$(oh-my-posh init zsh --config /home/phil/.config/oh-my-posh/omp.toml)"
sleep 2

# zoxide
eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit; compinit
eval "$(tmuxifier init -)"
