
#!/usr/bin/env zsh
# cg.zsh-theme
# Base on fino-time.zsh-theme,
# Thanks for Fino-time.

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    local symbal_shell=' %{$FG[051]%}\$%{$reset_color%}'
    if git branch>/dev/null; then echo "☼${symbal_shell}"; else echo "○${symbal_shell}"; fi
    # git branch >/dev/null 2>/dev/null && echo '☼' && return
    # echo '○ %{$FG[051]%}\$%{$reset_color%}' # '☼ ⛅︎'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

setopt prompt_subst
autoload zsh/terminfo

local rvm_ruby='‹$(rvm-prompt i v g)›%{$reset_color%}'
local current_dir='%{$FG[226]%}${PWD/#$HOME/~}%{$reset_color%}'
local git_info='%{$FG[129]%}$(git_prompt_info)%{$reset_color%}'
local local_name='%{$FG[051]%}%n%{$FG[231]%}♓︎%{$reset_color%}'
local current_time='%{$FG[245]%}‹%D{%y/%m/%f} %T›%{$reset_color%}'

PROMPT="╭─${local_name}%{$FG[239]%}in%{$reset_color%} ${current_dir}${git_info} ${current_time}
╰─$(virtualenv_info)$(prompt_char) "

# Theming variables for prompt, \uE0A0
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on git:%{$FG[135]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$FG[magenta]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}‹❄︎"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}‹‹✤"

ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"

# Theming variables for the secondary prompt
ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""
ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "
ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "
ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"
