#!/usr/bin/env bash
### Path
[[ -s $HOME/.bash_paths ]] && source $HOME/.bash_paths

# Check for boxen homebrew
[[ ! -d /usr/local && -d /opt/boxen/homebrew ]] && ln -s /opt/boxen/homebrew /usr/local

PATH=/usr/local/bin:$PATH
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
PATH=$PATH:/usr/local/git/bin
PATH=$PATH:$HOME/bin
export PATH=$PATH

### Environment Variables
export GRADLE_OPTS="-Xmx1g"
[[ -d /Library/Java/Home ]] && export JAVA_HOME=/Library/Java/Home
[[ -d /Library/Tomcat ]] && export CATALINA_HOME=/Library/Tomcat
[[ -d /Library/Tomcat/Home ]] && export CATALINA_HOME=/Library/Tomcat/Home
[[ -d /usr/local/ec2/ec2-api-tools ]] && export EC2_HOME=/usr/local/ec2/ec2-api-tools && export PATH=$PATH:$EC2_HOME/bin
[[ -d /usr/local/ec2/AutoScaling ]] && export AWS_AUTO_SCALING_HOME=/usr/local/ec2/AutoScaling && export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin

# For SSH
export SHCN="StrictHostKeyChecking=no"

### Aliases

# ls
alias l='ls -CF'
alias ls='ls -hF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

# Disk usage by Folder
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

complete -W "$(grep "^Host" ~/.ssh/config | sort | uniq | awk '{print $2}')" ssh


