#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set color options for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Confirm deletion
alias rm='rm -i'

# Start mpd (music player daemon) and then run ncmpcpp
alias music="mpd && ncmpcpp"

MPD_HOST=~/.mpd/socket

# Bash prompt
# user@hash Working_Directory
PS1='[\u@\h \W]\$ '
