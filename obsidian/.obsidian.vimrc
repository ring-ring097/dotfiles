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
" set ambiwidth=double (特殊記号を正しく表示できる)
set nobomb
set t_Co=256
" <<<

"--------------------------------------------------------------
"          Vim Options                                      <<<
"--------------------------------------------------------------
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
set cursorline         " 現在の行を強調表示
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set laststatus=2       " ステータスラインを常に表示
set wildmode=list:longest " コマ 
set noshowmode         " 現在のモードを非表示 (lightline.vimで表示されるため)
set norelativenumber
set belloff=all " ビープ音を消す
" <<<

"--------------------------------------------------------------
"          indent, space, tab                               <<<
"--------------------------------------------------------------
filetype plugin indent on

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

" 括弧の補完
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap ` ``<LEFT>

" 関数括弧の補完
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>

" コロンでノーマルモードへ
" inoremap ;; <ESC><S-a>;<ESC>
" inoremap ,, <ESC><S-a>,<ESC>

" カーソル系
nnoremap j gj
nnoremap k gk
nnoremap J gjgjgj
nnoremap K gkgkgk
nnoremap <C-h> H
nnoremap <C-l> L
nnoremap H 0
nnoremap L $
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
vnoremap J gjgjgj
vnoremap K gkgkgk
vnoremap H 0
vnoremap L $

" visulaモード
nnoremap vv viw
vnoremap / y/<C-r>"
vnoremap > >gv
vnoremap < <gv
vnoremap ' <Esc>`<i'<Esc>`><Right>a'<Esc>
vnoremap " <Esc>`<i"<Esc>`><Right>a"<Esc>
vnoremap ( <Esc>`<i(<Esc>`><Right>a)<Esc>
vnoremap ) <Esc>`<i(<Esc>`><Right>a)<Esc>
vnoremap { <Esc>`<i{<Esc>`><Right>a}<Esc>
vnoremap } <Esc>`<i{<Esc>`><Right>a}<Esc>
nmap <ESC><ESC> :nohlsearch<CR><ESC>


" 画面分割系
nnoremap gr gt
nnoremap t <C-w>w
nnoremap T <C-w>h
nnoremap ee :vs<CR>:e.<CR>

" バッファタブ
nnoremap nn :tabnew<CR>

" ヤンクボード系
nnoremap p "0p
nnoremap P p

" コマンドモード現在のパス表示
cnoremap <expr> :: getcmdtype() == ':' ? expand('.') . '/' : '%%'


