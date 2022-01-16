# Based on fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with Alacritty and git. Tested only on Arch and Ubuntu.

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo 'O' && return
    echo 'O'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}


PROMPT="╭─%{$FG[135]%}%n%{$reset_color%} %{$FG[240]%}at%{$reset_color%} %{$FG[069]%}$(box_name)%{$reset_color%} %{$FG[241]%}in%{$reset_color%} %{$terminfo[bold]$FG[081]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) $(date +%m/%d/%y) - %*
╰─\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

