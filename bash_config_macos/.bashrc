
export PATH=$PATH:~/workspace/bin

alias ll='ls -lh'
alias lt='ls -lhrt'
alias lsapp='ls -d */*.app'
alias dos2unix="tr '\r' '\n'"
alias goagent='~/workspace/goagent-3.0/goagent-3.0/local/goagent-osx.command'
alias vmu15='VBoxManage startvm u15 --type headless'
alias vmu14='VBoxManage startvm u14 --type headless'

alias eda1='ssh root@192.168.1.201 -X'
alias eda2='ssh root@192.168.1.202 -X'
export PS1='[\u@\h \W]\$ '
export PROMPT_COMMAND='{ msg=$(history 1 | { read x y; echo $y; });user=$(whoami); echo $msg:$PWD:$(date "+%Y-%m-%d %H:%M:%S"):$user:$(who am i); } >> ~/workspace/.history-$(date "+%Y-%m")'
cd ~/workspace
