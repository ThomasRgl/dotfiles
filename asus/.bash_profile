#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
#
# ~/.bashrc
#

#history
export HISTCONTROL=erasedups
export HISTSIZE=3000

#ocaml
eval $(opam env)

#GL4D
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

#IA DES JEUX
	#sc2
export PATH=$HOME/.local/bin:$PATH
export SC2PATH=$HOME/iaJeu/sc2/StarCraftII
	#Ludii
export JDK_HOME="/usr/lib/jvm/java-8-openjdk"
export JAVA_HOME=$JDK_HOME
	#Java de merde
export _JAVA_AWT_WM_NONREPARENTING=1
export DISPLAY=:0

#DWM
export DISPLAY=:0  exec dwm


#DISPLAY
#xrandr --output HDMI2 --mode 2560x1440 --left-of eDP1
#xrandr --output HDMI2 --mode 1920x1080 --rate 120 --left-of eDP1

# START XORG
startx

