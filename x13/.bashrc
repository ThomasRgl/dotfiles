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
# alias mcd
# alias cat='bat'


# alias G='|'
# alias G='  '

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"




PS1='[\u@\h \W]\$ '

#export DISPLAY=foo.bar:1 exec dwm
#startx
