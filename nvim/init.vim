"--------------------------------------------------------------
"          encoding & color                                 <<<
"--------------------------------------------------------------
"language en_US.UTF-8
set encoding=utf-8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set nobomb
set t_Co=256
" <<<

"--------------------------------------------------------------
"          options, indent, space, tab                      <<<
"--------------------------------------------------------------
filetype plugin indent on
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set smartindent "オートインデント
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示
set updatetime=1000
set noswapfile "スワップファイルを作らない
set tabstop=2 " タブの幅"
set shiftwidth=2
set autoindent
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set completeopt=menuone
set splitbelow         "画面を縦分割する際に下に開く
set cinoptions+=+1
set autoread           " 編集中のファイルが変更されたら自動で読み直す
set showcmd            " 入力中のコマンドをステータスに表示する
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set laststatus=2       " ステータスラインを常に表示
set wildmode=list:longest " コマ 
set noshowmode         " 現在のモードを非表示 (lightline.vimで表示されるため)
":set norelativenumber 
set norelativenumber
set belloff=all " ビープ音を消す
set cursorline " 行ハイライト

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=red gui=reverse guifg=red
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" <<<

"--------------------------------------------------------------
"          key mapping                                      <<<
"--------------------------------------------------------------
vnoremap x "_x
nnoremap x "_x
nnoremap bd :bd<CR>

" カーソル系
nnoremap j gj
nnoremap k gk
nnoremap <C-j> gjgjgj
nnoremap <C-k> gkgkgk
nnoremap J gjgjgj
nnoremap K gkgkgk
nnoremap <C-h> ^
nnoremap <C-l> $ 
vnoremap <C-j> gjgjgj
vnoremap <C-k> gkgkgk
vnoremap J gjgjgj
vnoremap K gkgkgk
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" 括弧の補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap () ()
inoremap ` ``<LEFT>
inoremap < <><LEFT>
nnoremap }} bi[<ESC>eli]<ESC>
nnoremap )) bi(<ESC>eli)<ESC>

" 関数括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
nnoremap "" bi"<ESC>eli"<ESC>
nnoremap '' bi'<ESC>eli'<ESC>
nnoremap " bhxelx
nnoremap " bhxelx

" クリップボード
nnoremap p "0p
nnoremap P p

" insertモードから抜ける
inoremap ;; <ESC><S-a>;<ESC>
inoremap ,, <ESC><S-a>,<ESC>
inoremap <C-]> <ESC>
vnoremap <C-[> <ESC>
imap <C-CR> <ESC>

" :を行末に
inoremap :: <ESC><S-a>:

" visulaモード
nnoremap vv viw
vnoremap > >gv
vnoremap < <gv
vnoremap / y/<C-r>"
vnoremap <C-h> ^
vnoremap <C-l> $

" コマンドモード
cnoremap <expr> :: getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" 画面分割系
nnoremap t <C-w>w
nnoremap T <C-w>h
nnoremap ee :vs<CR>:e.<CR>

" コメントアウト
noremap <C-c> <ESC>
nmap <C-c><C-c> gcc
vmap <C-c><C-c> gc

" ターミナル
tnoremap <silent> <C-[> <C-\><C-n>
nnoremap <C-t> :T<CR>
command! -nargs=* T split | wincmd j | resize 8 | terminal <args>
autocmd TermOpen * startinsert

" 大文字小文字変換
nnoremap <C-u> viwU
nnoremap U viwu
vnoremap <C-u> U
vnoremap U u

" Undo, Redo
nnoremap R <C-r>
vnoremap R <ESC>

" ハイライト削除
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 閉じタグ補完
inoremap <SPACE><SPACE> <ESC>viw"hy$i></<ESC>"hp<RIGHT>bb<RIGHT>i

 " set cursorline         " 現在の行を強調表示

"--------------------------------------------------------------
"          plugin manager                                   <<<
"--------------------------------------------------------------
" python3 のパス
let g:python3_host_prog = expand('~/nvim-python3/bin/python3')
" python2のパス
let g:python_host_prog = expand('~/nvim-python2/bin/python2')

if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.config/nvim/dein/')

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load plugins instantly
  let s:instantlyFiles = glob(s:toml_dir . 'instantly-load/*.toml')
  for file in split(s:instantlyFiles, "\n")
    call dein#load_toml(file)
  endfor

  " load plugins lazy
  let s:lazyFiles = glob(s:toml_dir . 'lazy-load/*.toml')
  for file in split(s:lazyFiles, "\n")
    call dein#load_toml(file, { 'lazy': 1 })
  endfor

  call dein#end()
  call dein#save_state()
endif

" 起動時にプラグインのキャッシュを削除
let g:dein#auto_recache = 1

" 手動リキャッシュ
" call dein#recache_runtimepath()

if dein#check_install()
  call dein#install()
endif
" <<<

"--------------------------------------------------------------
"          other settings                                   <<<
"--------------------------------------------------------------
" latex
let g:tex_flavor = "latex"
let maplocalleader=' '

