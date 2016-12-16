"-------------------------------------------------
" 基本設定
"-------------------------------------------------
" 文字コード
set fileencoding=utf-8

" ｽﾃｰﾀｽﾗｲﾝを表示
set laststatus=2 "ステータスラインを常に表示

" syntax
syntax on

" コマンドモードでtab補完
set nocompatible

" 行は出す
set number

" カーソルの上または下に表示する最小限の行数
set scrolloff=5

" カーソル行をハイライト
set cursorline

" 入力されているテキストの最大幅 「0」で無効
set textwidth=0

" バックアップの作成は行わない
set nobackup

" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread

" スワップファイルの作成は行わない
set noswapfile

" 保存しないで他のファイルを表示することが出来るようにする
set hidden

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 自動整形の実行方法
set formatoptions=lmoq

" ビープ音 ビジュアルベルを使用しない
set vb t_vb=

" スペースとタブを表示させる
set lcs=tab:>.,trail:_,extends:\
set list
"highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

" タグリスト
set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
map <silent> <leader>tl :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'
"-------------------------------------------------
" インデント設定
"-------------------------------------------------

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" <Tab> が対応する空白の数。
set tabstop=4

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set noexpandtab

" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab


"-------------------------------------------------
"キーマッピング
"-------------------------------------------------
" 十字キーを適応
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カッコやクオートなどを入力した際に左に自動で移動します
"inoremap { {<Left>
"inoremap [ [<Left>
"inoremap ( (<Left>
"inoremap " "<Left>
"inoremap ' '<Left>
"inoremap < <<Left>


"-------------------------------------------------
" ファイル補完
"-------------------------------------------------
autocmd FileType tpl set omnifunc=htmlcomplete#CompleteTags
autocmd FileType tpl set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"Ctrl+上下で5行ずつ移動
map <C-Up> <Up><Up><Up><Up><Up>
imap <C-Up> <Up><Up><Up><Up><Up>
map <C-Down> <Down><Down><Down><Down><Down>
imap <C-Down> <Down><Down><Down><Down><Down>

"-------------------------------------------------
" バンドル管理
"-------------------------------------------------
"Vi互換OFF
set nocompatible
filetype off
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'Shougo/neocomplcache'
    call neobundle#end()
endif


"ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on

"-------------------------------------------------
" neocomplcache設定
"-------------------------------------------------
"辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

