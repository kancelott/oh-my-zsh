PROMPT='%(!.{$fg_bold[red]%}%m.%{$bg[red]%}%{$fg_bold[white]%}%m):%{$reset_color%} %{$fg_bold[blue]%}%~
%{$fg[red]%}→ %{$reset_color%}'
RPROMPT='%{$fg_bold[magenta]%}%(1j.[%j] .)%{$reset_color%}$(svn_prompt_info)$(git_prompt_info)'

function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function svn_prompt_info() {
    if $(in_svn); then
        echo "$ZSH_THEME_SVN_PROMPT_PREFIX$(svn_dirty)r$(svn_get_rev_nr)$ZSH_THEME_SVN_PROMPT_SUFFIX"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg_bold[blue]%}svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg_bold[red]%}+"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg_bold[green]%}"
