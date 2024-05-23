###

export LANG="en_US.UTF-8"

export HISTFILESIZE="10000"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export PS1="${debian_chroot:+($debian_chroot)}\[$(tput setaf 2)\]\u\[$(tput setaf 7)\]:\[$(tput setaf 4)\]\w\[$(tput setaf 15)\] \\$ \[$(tput sgr0)\]"

autoload -U colors && colors
export PS1="%{$fg[green]%}%n%{$fg[white]%}@%{$fg[red]%}%m%{$fg[white]%} %{$fg[blue]%}%~%{$fg[white]%} %# %{$fg[white]%}"
#alias ls="ls -G"

export PATH=/usr/local/pkg/bin:/usr/local/pkg/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/Users/gpr/bin
export PATH=${PATH}:/Applications/Docker.app/Contents/Resources/bin/docker-compose-v1
export PATH=${PATH}:/Applications/Docker.app/Contents/Resources/bin
#export PATH=${PATH}:${HOME}/node_modules/apidoc/bin


#export WORKSPACE=$HOME/dev/route105/workspace
#source $WORKSPACE/route105-utils/route105-dev-utils.bash

export AL_I='https://api.product.dev.alertlogic.com'
export AL_GI='https://api.global-integration.product.dev.alertlogic.com'
export AL_PROD='https://api.cloudinsight.alertlogic.com'
export AL_PROD_UK='https://api.cloudinsight.alertlogic.co.uk'
export AL_GPROD='https://api.global-services.global.alertlogic.com'
export AL_MI='https://responder.mdr.product.dev.alertlogic.com'
export AL_R='https://responder.mdr.product.dev.alertlogic.com'
export AL_RP='https://api.responder.alertlogic.com'
export AL_RP_UK='https://api.responder.alertlogic.co.uk'
export AL_C='https://connectors.mdr.product.dev.alertlogic.com'
export AL_CP='https://connectors.mdr.global.alertlogic.com'
export KELT_PYTHON_PATH_DIR='/tmp/kelt'

export SSL_CERT_FILE="/etc/ssl/cert.pem"
alias al_curl='curl -H "x-aims-auth-token: `cat ~/.al_token.dat`"'
alias al_curl_prod='curl -H "x-aims-auth-token: `cat ~/.al_token_prod.dat`"'
alias jcurl='curl -H "Content-Type: application/json" -H "Accept: application/json"'
alias bicli="~/.venv/bicli_310/bin/bicli"

alias nrfjprog='env DYLD_LIBRARY_PATH="/Applications/Nordic Semiconductor/lib:/Applications/SEGGER/JLink_V792j" "/Applications/Nordic Semiconductor/bin/nrfjprog"'

#alias v="LD_LIBRARY_PATH=/usr/local/pkg/lib/libvterm nvim"
alias v="nvim"
export EDITOR=nvim

alias emm="~/.chefdk/gem/ruby/2.3.0/bin/emm"
alias alps="/Users/gennady.proskurin/.venv/alps_311/bin/alps"

#alias ssh_bastion_int="ssh -i ~/.ssh/al_bastion_rsa bastion-integration-us-west.backend-access.alertlogic.net"
#alias ssh_bastion_prod="ssh -i ~/.ssh/al_bastion_rsa bastion-production-us-west.backend-access.alertlogic.net"
#alias ssh_bastion_int="ssh -i ~/.ssh/al_bastion_rsa integration.dsaops.alertlogic.net"
#alias ssh_bastion_prod="ssh -i ~/.ssh/al_bastion_rsa production.dsaops.alertlogic.net"
alias ssh_bastion_int="ssh -A -i ~/.ssh/al_bastion_rsa integration-bastion.alertlogic.net"

bindkey "^[[3~" delete-char
bindkey '^R' history-incremental-search-backward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

###
