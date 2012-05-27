"vunlde.vimで管理してるpluginを読み込む
source ~/dotfiles/.vimrc.bundle
"Color関連
source ~/dotfiles/.vimrc.colors
"補完(completion)関連
source ~/dotfiles/.vimrc.completion
"表示関連
source ~/dotfiles/.vimrc.apperance


"swap なし
set noswapfile

"チルダ（バックアッップ）ファイルなし
set nobackup

" クリップボードのコピー
set clipboard+=autoselect


" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" Ctrl-i２回押しでカーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>


"タブをスペースで挿入(4スペース)
set expandtab
set ts=4 sw=4 sts=0

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する(4スペース)
autocmd BufWritePre * :%s/\t/    /ge


" ;でコマンド入力( ;と:を入れ替)
noremap ; :


" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 貼り付け時のコメントが自動で入るのを防止
autocmd FileType * set formatoptions-=ro


"シンタックスハイライト 拡張子に応じてPerlやHtmlを識別する
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead *.mt     set filetype=html


" syntastic シンタックスエラープラグイン
"HTMLは色々エラるのでとりあえずチェックしない
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
"エラったときQuickfixが立ち上がる
let g:syntastic_auto_loc_list = 1
"jshint,gjshintがインストールされている場合優先されるように設定
let g:syntastic_javascript_checker = 'jshint'




