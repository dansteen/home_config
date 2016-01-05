# we want to get the git name
git_basename(){
  if [ -d .git ]
  then
    basename `git rev-parse --show-toplevel`
  fi
}


# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
#ZSH_THEME_GIT_PROMPT_PREFIX="["
#ZSH_THEME_GIT_PROMPT_SUFFIX="]"


# Format for parse_git_dirty()
#ZSH_THEME_GIT_PROMPT_DIRTY="" # %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}="

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$RED%}@%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$RED%}➖%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$YELLOW%}&$%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$YELLOW_BOLD%}*%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$GREEN_BOLD%}+%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$WHITE%}."

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD="%{$RED%}▼▼"
# Format for git_prompt_behind()
ZSH_THEME_GIT_PROMPT_BEHIND="%{$RED%}▲▲"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
#RPS1='$(git_current_branch)$(git_prompt_status)$(ruby_prompt_info) $EPS1'

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
RPROMPT='%{$fg[magenta]%}$(git_basename) %{$fg[white]%}$(git_current_branch)$(parse_git_dirty) $(git_prompt_status)$(git_prompt_remote)%{$RESET_COLOR%}'
