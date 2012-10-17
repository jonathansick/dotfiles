# ZSH prompt using vcs_info, by Jonathan Sick
# Based on: http://eseth.org/2010/git-in-zsh.html#post-git-in-zsh
autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
# zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# setopt prompt_subst
# PROMPT='${vcs_info_msg_0_}%# '

# Show count of stashed changes
# https://raw.github.com/whiteinge/dotfiles/master/.zsh_shouse_prompt
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
            stashes=$(git stash list 2>/dev/null | wc -l)
            hook_com[misc]+=" (${stashes} stashed)"
    fi
}


# Indicate if there are any untracked files present
# https://raw.github.com/whiteinge/dotfiles/master/.zsh_shouse_prompt
function +vi-git-untracked() {
    local untracked

    #check if there's at least 1 untracked file
    untracked=${$(git ls-files --exclude-standard --others | head -n 1)}

    if [[ -n ${untracked} ]] ; then
        hook_com[unstaged]="${hook_com[unstaged]}${yellow}?${gray}"
    fi
}

# Executed before each prompt
function precmd {
    vcs_info
    setprompt
    # venv_rprompt
}

function setprompt {
    PROMPT='${vcs_info_msg_0_} '
}
