##SSHで接続した先で日本語が使える
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## ディレクトリとファイルの色分け
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

 ## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

##単語の途中でもカーソル位置からタブ補完可能
setopt complete_in_word

## カッコの対応を自動補完
setopt auto_param_keys

 ## 日本語ファイル名を表示可能にする
setopt print_eight_bit

 ## ビープを鳴らさない
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

## 入力ミスに対して候補をだす
setopt correct

## フローコントロールを無効にする
setopt no_flow_control

 ## '#' 以降をコメントとして扱う
setopt interactive_comments

 ## バックグラウンドジョブが終了したらすぐに知らせる。
setopt notify

 ## 重複したディレクトリを追加しない
setopt pushd_ignore_dups

 ## 高機能なワイルドカード展開を使用
setopt extended_glob

 ## 補完候補一覧でファイル種別を色分け
setopt list_types

 ## ヒストリの設定
export HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

 ## スペース始まりのコマンドを削除
setopt hist_ignore_space

 ## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

 ##全てのヒストリを出せるようにした
function history-all { history -E 1 }

 ##ヒストリのエイリアス
alias histall='history-all'

 ## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

 ## historyコマンドを履歴に追加しない
setopt hist_no_store

 ## 同時に起動したzshの間でヒストリを共有する
setopt share_history

 ## openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

 ## /を残して表示
setopt noautoremoveslash

## ctl Dでzshが終了しないようにする
setopt ignoreeof

 ## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

 ## neovim
export XDG_CONFIG_HOME=~/.config

 ## neovim
alias nv='nvim'

 ## docker-compose
alias dc='docker-compose'

 ## git
export PATH="$HOME/usr/local/bin/git:$PATH"

 ## rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

## nodebrew
export PATH=$PATH:/Users/naoya.ohsaki/.nodebrew/current/bin
export PATH=$PATH:/Users/oosakinaoya/.nodebrew/current/bin

## flutter set up
export PATH=$PATH:`pwd`/flutter/bin

## review
export PATH="$HOME/review/bin:$PATH"

## qt5.5
export PATH="/Users/naoya.ohsaki/Qt5.5.0/5.5/clang_64/bin:$PATH"

## direnv
export EDITOR="vi"
eval "$(direnv hook zsh)"

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# theme
zplug "themes/agnoster", from:oh-my-zsh
# 構文のハイライト
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# 移動強化
zplug "b4b4r07/enhancd"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

## zcompile
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

if (which zprof > /dev/null) ;then
  zprof | less
fi
