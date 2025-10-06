neofetch

#set to true to enter development mode
development_mode=true

#--------PROMPT-----------------------------------------------
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

dDefault='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

dcustom1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\[\033[01;36m\]\d \t\[\033[01;31m\]]\[\033[01;36m\]\u\[\033[01;31m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

dcustom2='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;31m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1=$dcustom2
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#---------BASH-CONFIG-----------------------------------------
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_customs ]; then
    . $HOME/.bash_customs
fi

#-------------------------------------------------------------
if [ -f $HOME/.cache/wal/colors.sh ]
then
    . $HOME/.cache/wal/colors.sh 
else
    . $HOME/.config/scripts/colors/catppuccin.sh
fi

#---------AUTO-COMPLETE---------------------------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#--------PATH-CONFIG------------------------------------------
export HISTCONTROL=ignoreboth

export PATH=$PATH:/home/alex/.spicetify:/home/alex/.config/scripts

#-------------------------------------------------------------
if [ $development_mode == true ]
then
    echo "Now in development mode. To exit development mode change in '.bashrc'"
    cd ~/.config
fi
