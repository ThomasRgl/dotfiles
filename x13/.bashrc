#
# ~/.bashrc
#

wmname LG3D

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias hostname='cat /etc/hostname'
alias v='nvim'
alias gdb='gdb -q'

alias open_gitlab='sshfs -o idmap=user troglin@gitlab-chps.ens.uvsq.fr:/home/troglin /home/trgk/stage/gitlab/'
alias open_lennon='sshfs -o ssh_command="ssh -J troglin@frontal" troglin@lennon:/home/troglin  /home/trgk/stage/lennon' 
# alias open_knl01='sshfs -o ssh_command="ssh -J troglin@fob1" troglin@knl01:/home/troglin  /home/trgk/stage/knl01' 
alias open_knl='sshfs -o idmap=user troglin@fob1:/home/troglin /home/trgk/stage/knl01/'
alias set_proxy='export http_proxy=http://192.168.49.1:8282/;export https_proxy=http://192.168.49.1:8282/'

alias close_gitlab='fusermount -u /home/trgk/stage/gitlab'
alias close_lennon='fusermount -u /home/trgk/stage/lennon'
alias close_knl='fusermount -u /home/trgk/stage/knl01'


# alias mcd
# alias cat='bat'


# alias G='|'
# alias G='  '

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"




PS1='[\u@\h \W]\$ '

#export DISPLAY=foo.bar:1 exec dwm
#startx
. "$HOME/.cargo/env"
