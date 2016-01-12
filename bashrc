# vim aliases & functions
alias vimde='vim -c "NERDTree"'

# docker aliases & functions
alias dps='docker ps'
alias drm='docker rm'
alias drmall='docker rm -f $(docker ps -a -q)'
alias drmiall='docker rmi -f $(docker images -q)'
alias dcomp='docker-compose'

docker-reset() {
    drmall
    drmiall
}

GIT_PS1_SHOWDIRTYSTATE='True'
source ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\w\[\033[0;36m\]" "\[\033[m\]\\\$ "'
PROMPT_COMMAND="$PROMPT_COMMAND"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

alias_function() {
    eval "${1}() $(declare -f ${2} | sed 1d)"
}

alias_function orig_command_not_found_handle command_not_found_handle

command_not_found_handle() {
    command=$1
    shift
    args=( "$@" )

    ec2_ip=$(~/get_ec2_ip.py "$command")
    if [ "$ec2_ip" != "" ]
    then
        ssh $ec2_ip
        exit
    fi

    orig_command_not_found_handle "$command" "${args[@]}"
}
