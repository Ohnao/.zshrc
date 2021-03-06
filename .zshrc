# gitの状態を表示するメソッド
function git-current-branch() {
    local branch_name st branch_status

    branch='\ue0a0'
    color='%{\e[38;5;' #  文字色を設定
    green='046m%}'
    red='001m%}'
    orange='208m%}'
    flat_orange='178m%}'
    subtle_orange='222m%}'
    blue='033m%}'
    reset='%{\e[0m%}' # reset
    if [ ! -e ".git" ]; then
        return
    fi
    branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    st=$(git status 2>/dev/null)

    if [[ -n $(echo "$st" | grep "^Untracked files") ]]; then
        # git 管理されていないファイルがある状態
        branch_status="${color}${red}${branch}?"
    elif [[ -n $(echo "$st" | grep "^Changes not staged for commit") ]]; then
        # git add されていないファイルがある状態
        branch_status="${color}${orange}${branch}!"
    elif [[ -n $(echo "$st" | grep "^Changes to be committed") ]]; then
        # git commit されていないファイルがある状態
        branch_status="${color}${flat_orange}${branch}+"
    elif [[ -n $(echo "$st" | grep "Your branch is ahead") ]]; then
        # git pushされていない状態
        branch_status="${color}${subtle_orange}${branch}+"
    elif [[ -n $(echo "$st" | grep "^nothing to") ]]; then
        # 全て commit されてクリーンな状態
        branch_status="${color}${green}${branch}"
    elif [[ -n $(echo "$st" | grep "^rebase in progress") ]]; then
        # コンフリクトが起こった状態
        echo "${color}${red}${branch}!(no branch)${reset}"
        return
    else
        # 上記以外の状態の場合
        branch_status="${color}${blue}${branch}"
    fi
    # ブランチ名を色付きで表示する
    echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`git-current-branch`'

#コマンドプロンプトカスタマイズ
export CLICOLOR=1

function left-prompt() {
    name_t='040m%}' # user name text clolr
    name_b='000m%}' # user name background color
    path_t='051m%}' # path text clolr
    path_b='056m%}' # path background color
    git_t='030m%}'  # git text color
    git_b='124m%}'  # git background color
    arrow='202m%}'  # arrow color

    text_color='%{\e[38;5;'    # set text color
    back_color='%{\e[30;48;5;' # set background color
    reset='%{\e[0m%}'          # reset
    sharp='\uE0B0'             # triangle

    user="${back_color}${name_b}${text_color}${name_t}"
    dir="${back_color}${path_b}${text_color}${path_t}"

    echo "${user}%n@%m${back_color}${path_b}${text_color}${name_b}${sharp}${dir}%~${back_color}${git_b}${text_color}${path_b}${sharp}${RPROMPT}${text_color}${git_b}${sharp}${reset}\n${text_color}${arrow}>>${reset}"
}

# プロンプトの左側にメソッドの結果を表示させる
PROMPT=$(left-prompt)

#brewで落としたgitのパス
export PATH="/usr/local/opt/git/bin:$PATH"

#Flutter本体のパス
export PATH="/Users/naoya.ohsaki/flutter_products/flutter/bin:$PATH"

#nodebrewのパス
export PATH=$HOME/.nodebrew/current/bin:$PATH

#lsを高機能
alias ls="ls -GF"

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
function history-all() {
    history -E 1
}

##ヒストリのエイリアス
alias histall='history-all'

## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

## historyコマンドを履歴に追加しない
setopt hist_no_store

## 同時に起動したzshの間でヒストリを共有する
setopt share_history
