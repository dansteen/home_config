# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Check for an interactive session
[ -z "$PS1" ] && return

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="legacy"
export GIT_PS1_SHOWCOLORHINTS=1

source ~/projects/git-prompt.sh

# set some color variables
bold=`tput bold`
black=`tput setaf 0` # 0 Black
red=`tput setaf 1` # 1 Red
green=`tput setaf 2` # 2 Green
yellow=`tput setaf 3` # 3 Yellow
blue=`tput setaf 4` # 4 Blue
magenta=`tput setaf 5` # 5 Magenta
cyan=`tput setaf 6` # 6 Cyan
white=`tput setaf 7` # 7 White
reset=`tput sgr0`

# figure out what chef config we are using if we are in a chef folder
# also display git info
export PROMPT_COMMAND='
	if [[ "$PWD" == */chef-repo* ]]
	then 
		CHEF_ENV=`readlink ~/projects/chef-repo/.chef/knife.rb`
	  ORG="${CHEF_ENV##*-}"
	  ORG="${ORG%%.*}"
		# depending on the result we do different coloring

		case $ORG in
			traitify)
			  echo -n $red
				;;
			dsteen)
				echo -n $yellow
				;;
			*)
				echo -n $cyan
				;;
		esac

	  echo -n "$ORG"

    REPO=`basename $(git remote show -n origin|grep Fetch|cut -d: -f2-) .git`
    echo -n " $white$REPO$reset"

    GIT_INFO=$(__git_ps1 " (%s)")
    case $GIT_INFO in
      *master*)
        echo -n $magenta
        ;;
      *regression*)
        echo -n $yellow
        ;;
      *production*)
        echo -n $red
        ;;
    esac
    echo " $GIT_INFO$reset"
    fi'

alias ls='ls --color=auto'
#export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# trying out vi mode
set -o vi

export PATH=$PATH:/opt/elb-api-tools/bin:~/scripts
export AWS_ELB_HOME=/opt/elb-api-tools
export AWS_CREDENTIAL_FILE=~/.aws/credentials
export CHEF_REPO=~/projects/chef-repo
export AWS_ACCESS_KEY_ID=`grep aws_access_key_id ~/.aws/config | awk '{print $3}'`
export AWS_SECRET_ACCESS_KEY=`grep aws_secret_access_key ~/.aws/config | awk '{print $3}'`
export AWS_DEFAULT_REGION="us-east-1"
export TF_VAR_aws_access_key="$AWS_ACCESS_KEY_ID"
export TF_VAR_aws_secret_key="$AWS_SECRET_ACCESS_KEY"
export TF_VAR_dud_prefix="" # if you want to change the launch config for terraform autoscale groups, change this to "dud_"
export TF_VAR_consul_token=`grep consul_token ~/.terraform_config | awk '{print $3}'`

#eval "$(rbenv init -)"
source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
