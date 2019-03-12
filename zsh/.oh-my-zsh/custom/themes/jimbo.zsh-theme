local return_code="%(?..%{$fg[blue]%}%? ↵)"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m'
    local user_symbol='%F{178}λ%f'
fi

local shit_show='%F{178}%n%f'

local current_dir='%F{168}%B%~%f%b'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›'
  fi
fi
local git_branch='$(git_prompt_info)'

PROMPT="╭─ ${shit_show} ${current_dir} ${git_branch}
╰─ %B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{black}%K{214}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%f%k "

