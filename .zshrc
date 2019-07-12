 ##SSHで接続した先で日本語が使える
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

 ## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

 ## 日本語ファイル名を表示可能にする
setopt print_eight_bit

 ## ビープを鳴らさない
setopt no_beep

 ## フローコントロールを無効にする
setopt no_flow_control

 ## '#' 以降をコメントとして扱う
setopt interactive_comments

 ## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

 ## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

 ## 重複したディレクトリを追加しない
setopt pushd_ignore_dups

 ## 高機能なワイルドカード展開を使用
setopt extended_glob

 ## ヒストリの設定
export HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
## スペース始まりのコマンドを削除
setopt hist_ignore_space

 ## 同時に起動したzshの間でヒストリを共有する
setopt share_history

 ## openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

 ## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

 ## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

 ## neovim
export XDG_CONFIG_HOME=~/.config

# エイリアス設定

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

## flutter set up
export PATH=$PATH:`pwd`/flutter/bin

## review
export PATH="$HOME/review/bin:$PATH"

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

## .zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
