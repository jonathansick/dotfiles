# ZSH prompt using vcs_info, by Jonathan Sick
# Based on: http://eseth.org/2010/git-in-zsh.html#post-git-in-zsh
autoload -U colors && colors
autoload -Uz vcs_info

# zstyle ':vcs_info:*+*:*' debug true
zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st git-stash git2symbol


# Formats for git vcs_info
# see http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
# for syntax
# To show SHA turn on get-revision and use code: %.7i
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%s %r %b%m
"

# Lets me customize the vcs_message for git
# Based on the vcs_info docs, search svn2subversion
function +vi-git2symbol() {
    hook_com[vcs]=±
}

# Show count of stashed changes
# https://raw.github.com/whiteinge/dotfiles/master/.zsh_shouse_prompt
function +vi-git-stash() {
    local -a stash_count

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
            stash_count=$(git stash list 2>/dev/null | wc -l)
            hook_com[misc]+=" (${stash_count} stashed)"
    fi
}

# Show remote ref name and number of commits ahead-of or behind
# https://raw.github.com/whiteinge/dotfiles/master/.zsh_shouse_prompt
# j Explained: http://stackoverflow.com/questions/10796371/manipulate-zsh-arrays-with-operator-j
# This needs git 1.7+
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
            --symbolic-full-name --abbrev-ref 2>/dev/null)}
    # Are we on a remote-tracking branch?
    if [[ -n ${remote} ]] ; then
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
                (( $behind )) && gitstatus+=( "%{$fg[red]%}❰${behind}" )
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
                (( $ahead )) && gitstatus+=( "%{$fg[cyan]%}${ahead}❱" )
        if [[ $ahead == "0" && $behind == "0" ]]; then
            gitstatus=( "⇄" )  # default if in sync
        fi
        hook_com[branch]="${hook_com[branch]} ${(j: :)gitstatus} %{$fg[blue]%}${remote}"
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
    PROMPT="${vcs_info_msg_0_}%{$fg[red]%}»%{$reset_color%} "
    RPROMPT="%{$fg[yellow]%}%n@%m %~%{$reset_color%} %(?..%{$fg[red]%}%? ↵%{$reset_color%})"
    # Alt return code for right prompt
    # http://www.lowlevelmanager.com/2012/03/smile-zsh-prompt-happysad-face.html
    # RPROMPT='%(?,:%),%? :() %~'
}
