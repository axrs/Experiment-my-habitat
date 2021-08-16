bass source $HOME/.nvm/nvm.sh --no-use ';'
set -gx EDITOR vim
set -gx LEIN_USE_BOOTCLASSPATH no
set -gx LEIN_SNAPSHOTS_IN_RELEASE 1
set -gx PATH $PATH $HOME/bin

set -g theme_nerd_fonts yes
set -g theme_display_docker yes
set -g theme_display_cmd_duration yes

eval (direnv hook fish)

set fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert
set -U keychain_init_args --quiet --agents ssh id_rsa github_id_rsa

setenv SSH_ENV $HOME/.ssh/environment

alias p="project"
alias g="git"
alias ls="ls -alhG --color=auto"
alias vim="nvim"
alias vi="nvim"
alias gvim="nvim"
