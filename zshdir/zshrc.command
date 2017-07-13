### Alias類
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias x="exit"
alias tree="tree -F -C --dirsfirst"
alias relogin='exec $SHELL -l'

# http://qiita.com/yusabana/items/b5cc2a706be8c031043e
LESS=-qR # ビープ音を消して、ANSIカラーシーケンス

alias vi='vim'
alias nvi='nvim'

# Ruby のctag用
alias rtags='ctags -R -a --sort=yes --exclude="*.js" --exclude="*.h" --exclude=log --exclude="*.yml" --exclude=".git"'

# Sublime Text 2
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl "$@"'
# IDE起動
alias eclipse='open -n /Applications/eclipse/Eclipse.app'
alias idea='open -n /Applications/IntelliJ\ IDEA\ 12\ CE.app'

# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"

# 検索コマンドの結果をlessにパイプ カラー表示とlessを閉じても画面に残す設定
alias ag="ag -S --pager='less -R --no-init --quit-if-one-screen'"

# diffコマンドをカラーにする
alias diff="colordiff"

# SVN関連
alias svn-vim-diff='svn diff "$@" |vim -R -'

# インストールしたCpanモジュールを出力
alias pm-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"
alias pm-version='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"

### Mac Only
# クイックルック起動
# 次のコマンドをdefaults実行するとquicklookでテキスト選択できるようになる
# defaults write com.apple.finder QLEnableTextSelection -bool true
if [ -f /usr/bin/qlmanage ]; then
  alias ql='qlmanage -p "$@" >& /dev/null'
fi

# chromeコマンドでヘッドレスブラウザ利用
# https://developers.google.com/web/updates/2017/04/headless-chrome?hl=ja
if [ -f /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  # chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com
fi
