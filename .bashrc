#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;37m\][\w]\[\e[0;93m\] # \[\e[0;97m\]'
export PATH="$PATH:~/scripts"
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh'
alias restart='sudo reboot'
alias off='sudo shutdown -hP now'
alias bootwin='sudo cp /boot/syslinux/syslinux.cfg.win /boot/syslinux/syslinux.cfg; sudo reboot'
alias bootrevert='sudo cp /boot/syslinux/syslinux.cfg.lin /boot/syslinux/syslinux.cfg'
alias pacman='sudo pacman-color'
alias grep='grep --color=auto'
alias textemplate='cd ~/.vim/ftplugin/latex-suite/templates'
