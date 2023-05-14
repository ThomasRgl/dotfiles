#supprimer beep pc
#echo "blacklist pcspkr" > sudo tee /etc/modprobe.d/nobeep.conf
# rmmod pcspkr 

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
#
# ~/.bashrc
#

#history
export HISTCONTROL=erasedups
export HISTSIZE=40000

#ocaml
eval $(opam env)

# impersonate dwm to make scilab work
#wmname LG3D

#GL4D
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# mpi
export PATH=/usr/local/mpich-3.4.1/bin:$PATH

##
#DWM
export DISPLAY=:0 

#export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

#DISPLAY
#xrandr --output HDMI2 --mode 2560x1440 --left-of eDP1
#xrandr --output HDMI2 --mode 1920x1080 --rate 120 --left-of eDP1

# START XORG
startx

