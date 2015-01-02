#!/bin/sh

files=(
  .gitconfig
  .gitconfig.local
#  .hgrc
  .tigrc
  .tmux.conf
  .vimrc
  .zlogin
  .zshenv
  .zshrc
)

now=`date '+%Y%m%d'`

for file in "${files[@]}"; do
  absolute_file=$HOME/$file

  if [[ -f $absolute_file ]]; then
    echo "$file を置き換えますか？（y / n）"
    while read line; do  # シェルの標準入力から読み込む方法
      if [ $line = 'y' ]; then
        mv $absolute_file ${absolute_file}_$now
        ln -s $HOME/dotfiles/$file $absolute_file
        echo "ファイルを $file_$now でバックアップしてリンクに置き換えました"
        break
      elif [ $line = 'n' ]; then
        break
      else
        echo "$file を置き換えますか？（y / n）"
      fi
    done

  else
    ln -s $HOME/dotfiles/$file $absolute_file
    echo "$file リンクを作成しました"

  fi
done


# reattach-to-user-namespaceのシンボリックリンク作成 <-ここは環境に合わせてをENVを書き換える
if [ -f $HOME/dotfiles/my-bin/reattach-to-user-namespace ]; then
  echo "ファイルあり"
else
  ln -s $HOME/dotfiles/tmuxdir/reattach-to-user-namespace_[ENV] $HOME/dotfiles/my-bin/reattach-to-user-namespace
  echo "ファイルなし"
fi

