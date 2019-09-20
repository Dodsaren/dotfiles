export ZSH=/Users/$USER/.oh-my-zsh
ZSH_THEME="jimbo"
export LC_ALL=en_US.UTF-8
plugins=(
  git
  nvm
)
source $ZSH/oh-my-zsh.sh
alias szp="source ~/.zshrc"
alias rni="npx react-native run-ios"
alias rna="npx react-native run-android"
hash -d jim=~/kod/jim
hash -d holm=~/kod/jim/quiz2/holm
hash -d haren=~/kod/jim/quiz2/server
hash -d bn=~/kod/bn
hash -d flamingo=~/kod/bn/flamingo
hash -d flapp=~/kod/bn/flapp
hash -d flapp-api=~/kod/bn/flapp-api
hash -d ftg=~/kod/bn/DagensIndustri.Foretagsportal
typeset -AHg FX FG BG
FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)
for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done
ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="$HOME/Downloads/openshift-origin-client-tools-v3.9.0-191fece-mac:$PATH"
PATH="$HOME/Downloads/phantomjs-2.1.1-macosx/bin:$PATH"
PATH="$HOME/.fastlane/bin:$PATH"

ANDROID_HOME="$HOME/Library/Android/sdk"
PATH="$ANDROID_HOME/emulator:$PATH"
PATH="$ANDROID_HOME/tools:$PATH"
PATH="$ANDROID_HOME/tools/bin:$PATH"
PATH="$ANDROID_HOME/platform-tools:$PATH"

export ANDROID_HOME
export PATH
if [ -f '/Users/jim.nilsson/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jim.nilsson/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/jim.nilsson/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jim.nilsson/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

