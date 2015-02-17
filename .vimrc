" エンコード設定 {{{
"エンコードをutf-8にセット"
scriptencoding utf-8
set encoding=utf-8
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileencodings=utf-8
"別になくてもvimの規定値が使われるよ"
"set nocompatible

"----------------------------------------}}}
" Which OS use?{{{
"----------------------------------------
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
			\ && (has('mac') || has('macunix') || has('gui_macvim') ||
			\   (!executable('xdg-open') &&
			\     system('uname') =~? '^darwin'))
let s:is_kaoriya = has('kaoriya')

if s:is_windows
	language message en
else
	language message C
endif

"----------------------------------------}}}
" 共有設定 {{{
"----------------------------------------
" セッションファイルをホームディレクトリに保存
"au VimLeave * mks! ~/session.vim
"au VimEnter * :so ~/session.vim

" スワップファイルをホームディレクトリに保存
"set swapfile
"set directory=~/.vimswap
"スワップファイルはいらない
set noswapfile
set nobackup
set noundofile

" バックアップファイルをホームディレクトリに保存
"set backup
"set backupdir=~/.vimbackup

"----------------------------------------}}}
" augroup{{{
"----------------------------------------
" release autogroup in MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup END
"----------------------------------------}}}
" neobundle {{{
"----------------------------------------
" To set up NeoBundle
" $ mkdir ~/.vim/bundle
" $ cd ~/.vim/bundle
" $ git clone https://github.com/Shougo/neobundle.vim
" you may be required to install git on your computer.
" vimのバージョンによって入っていないものがあることがある
" sudo apt-get install vim vim-gnome vim-athena vim-gtk vim-nox vim-tiny

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
endif

"neobundle自身をneobundleで管理"
NeoBundleFetch 'Shougo/neobundle.vim'
"コードをとりあえず実行できる 偉い"
NeoBundle 'thinca/vim-quickrun', {
            \ 'depends' : 'mattn/quickrunex-vim',
            \ }

"NeoBundle 'Shougo/neobundle.vim'
"非同期処理"
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\ 'windows' : 'make -f make_mingw32.mak',
			\ 'cygwin' : 'make -f make_cygwin.mak',
			\ 'mac' : 'make -f make_mac.mak',
			\ 'unix' : 'make -f make_unix.mak',
			\ },
			\ }
"vimでshellが使えるよ"
NeoBundle 'Shougo/vimshell'
"統合UI データ操作が簡単にできるらしい"
NeoBundle 'Shougo/unite.vim'
"ソースファイルからアウトラインを作成"
NeoBundle 'Shougo/unite-outline'
"vimで起動できるファイラー"
NeoBundle 'Shougo/vimfiler'
"vimで補完してくれるやつ"
NeoBundle 'Shougo/neocomplcache'
"スニペット補完"
NeoBundle 'Shougo/neosnippet.vim'
"各種スニペット"
NeoBundle 'Shougo/neosnippet-snippets'
"整形ツール"
NeoBundle 'Align'
"vim-latex
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"NeoBundle 'vim-latex/vim-latex'
NeoBundle 'lervag/vim-latex'
"自然言語文法チェック
NeoBundle 'rhysd/vim-grammarous'
"gauche用
"vimでgaucheを使うためとコマンドラインみたいに扱うもの
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'
"ruby用
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
"NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'
" ファイルをtree表示してくれる
"NeoBundle 'scrooloose/nerdtree'
" ファイル作成時にテンプレート挿入
NeoBundle 'thinca/vim-template'
"インデントをわかりやすく表示
"NeoBundle 'Yggdroot/indentLine'
"テキストを囲う
NeoBundle 'tpope/vim-surround'

"インストールしていないプラグインがあったら警告"
NeoBundleCheck

filetype plugin indent on

"----------------------------------------}}}
"   {{{
"----------------------------------------
"backspaceの動作を普通のエディタみたいに
set backspace=indent,eol,start

"splitを下に表示する"
set splitbelow

"改行コードの自動認識"
set fileformats=unix,dos,mac

"ファイルの上書きの前にバックアップを作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup

"クリップボードを共有
"set clipboard+=unnamed
set clipboard=unnamed,autoselect
set clipboard=unnamedplus

"日本語の行の連結時には空白を入力しない
set formatoptions+=mM

"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"コマンドライン補完するときに強化されたものを使う
set wildmenu

"tabでタブ文字を入力
set noexpandtab
"長い行を折り返し表示
set wrap
" 最下ウィンドウにいつステータス行が表示されるかを設定する
"               0: 全く表示しない
"               1: ウィンドウの数が2以上のときのみ表示
"               2: 常に表示
set laststatus=1
" コマンドラインに使われる画面上の行数
set cmdheight=2
"コマンド (の一部) を画面の最下行に表示
set showcmd

set title

set mouse=a

set whichwrap=b,s,h,l,<,>,[,],~

set foldmethod=syntax

set hidden

"----------------------------------------}}}
" 検索 {{{
"----------------------------------------

"検索の時に大文字小文字を区別しない
set ignorecase
"大文字小文字の両方が含まれている場合は大文字小文字を区別す
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"背景色
set bg=dark

"----------------------------------------}}}
" 表示設定 {{{
"----------------------------------------   
"スプラッシュ(起動時のメッセージ)を表示しな
set shortmess+=I
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"タブを設定
set ts=4 sw=4 sts=4
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
",eol:↲,
"set nolist
"set listchars=tab:^\ ,trail:
" Two-byte space
autocmd ColorScheme * hi link TwoByteSpace Error
autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("TwoByteSpace", '　')

set modeline
set modelines=3

set foldmethod=marker
set foldcolumn=4
set foldlevel=0

"行を表示"
set number
"(){}の対応表示"
set showmatch
"□や○の文字があってもカーソル位置がずれないようにす 
set ambiwidth=double

"自動インデント"
set autoindent
set smartindent
set cindent
"autoindentの時のインデント文字数"
set shiftwidth=4
"----------------------------------------}}}
"quickrun_config {{{
"----------------------------------------
"default"
"g++"
let g:quickrun_config = {
			\   "_" : {
			\       "hook/add_include_option/enable" : 1,
			\       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
			\       "hook/unite_quickfix/enable_failure" : 1,
			\       "hook/unite_quickfix/enable_full_data" : 1,
			\       "hook/close_quickfix/enable_exit" : 1,
			\       "hook/close_buffer/enable_failure" : 1,
			\       "hook/close_buffer/enable_empty_data" : 1,
			\       "outputter" : "error",
			\       "outputter/error/success" : "buffer",
			\       "outputter/error/error"   : "quickfix",
			\       "outputter/quickfix/open_cmd" : "copen",
			\       "outputter/buffer/split" : ":botright 8sp",
			\		"output_encode" : "utf-8",
			\       "runner" : "vimproc",
			\       "runner/vimproc/updatetime" : 40,
			\		'split': '',
			\       "hook/time/enable" : 1
			\   },
			\	"cpp" : {
			\		"type" : "cpp/clang++",
			\	},
			\	"c" : {
			\		"type" : "c/clang",
			\	"cmdopt" : "-lm"
			\	},
			\	"cpp/clang" : {
			\	"command"   : "clang++",
			\	"cmdopt" : "-lm",
			\	},
			\	"cpp/clang++" : {
			\	"command"   : "clang++",
			\	"cmdopt" : "-std=c++11",
			\	},
			\   "cpp/g++" : {
			\       "cmdopt" : "-std=c++11"
			\	},
			\	"c/gcc" : {
			\		"cmdopt" : "-lm"
			\   },
			\ }

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"---------------------------------------}}}
"vimshell {{{
"---------------------------------------
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '


"---------------------------------------}}}
"Unite {{{
"---------------------------------------
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"----------------------------------------}}}
" neocomplcache {{{
"----------------------------------------
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"----------------------------------------}}}
" vimfiler {{{
"----------------------------------------
let vimfiler_as_default_explorer=1
let vimfiler_safe_mode_by_default=0
let vimfiler_enable_clipboard=1
let vimfiler_pedit_command="edit"
let vimfiler_trashbox_directory = expand('~/.local/share/Trash/files')

"----------------------------------------}}}
" keymap {{{
"----------------------------------------
" Spaceキーで画面スクロール
"nnoremap <SPACE>   <PageDown>
" Shift+Spaceキーで画面逆スクロール
"nnoremap <S-SPACE> <PageUp>

:imap ;; <Esc>
" Ctrl+Nで次のバッファを表示、Ctrl+Pで前のバッファを表示
map <C-N> :bnext<CR>
map <C-P> :bprevious<CR>
"map <C-.> :bnext<CR>
"map <C-,> :bprevious<CR>
" バッファ削除
"map <C-P> :bw<CR>
map <C-T> :VimFiler ~/<CR>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-d> <Del>
cmap <C-h> <BackSpace>
cmap <C-g> <Esc>
cmap <C-n> <Down>
cmap <C-p> <Up>

" 強制保存終了を無効化
nnoremap ZZ zz
"<C-e>で拡張子で判断してスクリプト実行
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %


"---------------------------------------}}}
" Vim-LaTeX {{{
"---------------------------------------
"filetype plugin on
"filetype indent on
"set shellslash
"set grepprg=grep\ -nH\ $*
"set winaltkeys=no
"let g:tex_flavor='latex'
"let g:Imap_UsePlaceHolders = 1
"let g:Imap_DeleteEmptyPlaceHolders = 1
"let g:Imap_StickyPlaceHolders = 0
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
""let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
""let g:Tex_BibtexFlavor = 'pbibtex'
"let g:Tex_BibtexFlavor = 'upbibtex'
""let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
"let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1
"if s:is_windows
"	let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"	let g:Tex_CompileRule_dvi = 'uplatex -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"	let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n -c \":RemoteOpen +\%l \%f\""'
"else
"	let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"	let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"	let g:Tex_ViewRule_pdf = 'evince'
"endif
"let g:Tex_ViewRule_ps = 'evince'
"let g:Tex_ViewRule_dvi = 'pxdvi -watchfile 1'
"
"let g:Tex_Diacritics = 1
"
"let g:Tex_IgnoreLevel = 9 
"let g:Tex_IgnoredWarnings = 
"			\"Underfull\n".
"			\"Overfull\n".
"			\"specifier changed to\n".
"			\"You have requested\n".
"			\"Missing number, treated as zero.\n".
"			\"There were undefined references\n".
"			\"Citation %.%# undefined\n".
"			\"LaTeX Font Warning: Font shape `%s' undefined\n".
"			\"LaTeX Font Warning: Some font shapes were not available, defaults substituted."

"----------------------------------------}}}
" unite {{{
"----------------------------------------
" 入力モードで開始する
" " let g:unite_enable_start_insert=1
" " バッファ一覧
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" " ファイル一覧
"nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" " レジスタ一覧
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" " 最近使用したファイル一覧
"nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" " 常用セット
"nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" " 全部乗せ
"nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer
" file_mru bookmark file<CR>
"
" " ウィンドウを分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-j>
" unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-j>
" unite#do_action('split')
" " ウィンドウを縦に分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-l>
" unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-l>
" unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
" au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" 
"----------------------------------------}}}
" vimgoshrepl{{{
"----------------------------------------
"let g:neocomplcache#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
"let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
"vmap <CR> <Plug>(gosh_repl_send_block)
":Unite gosh_infoを実行します
"nmap gi <Plug>(gosh_info_start_search)
":Unite カーソル位置のシンボルを初期値に:Unite gosh_infoを実行します
"nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
"imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)

"ginfoウィンドウのスクロールアップ・ダウン
"nmap <C-K> <Plug>(gosh_info_row_up)
"nmap <C-J> <Plug>(gosh_info_row_down)
"imap <C-K> <Plug>(gosh_info_row_up)
"imap <C-J> <Plug>(gosh_info_row_down)
"ginfoウィンドウを閉じます
"nmap <C-C> <Plug>(gosh_info_close)
"imap <C-C> <Plug>(gosh_info_close)

"カーソル位置のシンボルが定義されている場所にジャンプ
"nmap <F12> <Plug>(gosh_goto_define)
"nmap <F11> <Plug>(gosh_goto_define_split)

"----------------------------------------}}}
" vim-indent-guides {{{
"----------------------------------------
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
"let g:indent_guides_guide_size=1
"let g:indent_guides_start_level=2
"----------------------------------------}}}
" vim-template {{{
"----------------------------------------
" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
	silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
	silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
autocmd MyAutoCmd User plugin-template-loaded
			\   if search('<+CURSOR+>')
			\ |   silent! execute 'normal! "_da>'
			\ | endif
"----------------------------------------}}}
" indentline {{{
"----------------------------------------
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#708090'
"let g:indentLine_char = '' "use ¦, ┆ or │
"----------------------------------------}}}
" template.* {{{
"----------------------------------------
"autocmd BufNewFile *.c 0r $HOME/.vim/template/template.c
"autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
"autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
"autocmd BufNewFile *.rb 0r $HOME/.vim/template/template.rb
"autocmd BufNewFile *.scm 0r $HOME/.vim/template/template.scm
"autocmd BufNewFile *.sh 0r $HOME/.vim/template/template.sh
"autocmd BufNewFile *.tex 0r $HOME/.vim/template/template.tex
"----------------------------------------}}}
" vim-latex {{{
"----------------------------------------
let g:latex_latexmk_continuous = 1
let g:latex_latexmk_background = 1
let g:latex_latexmk_options = '-pdfdvi'

if s:is_windows
	let g:latex_view_method = 'sumatrapdf'
	let g:latex_view_sumatrapdf_options = '-reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n --remote-silent +\%l \"\%f\""'
	let g:latex_view_general_viewer = 'texworks'
elseif s:is_mac
	let g:latex_view_general_viewer = 'open'
else
	let g:latex_view_method = 'evince'
	let g:latex_view_general_viewer = 'xdg-open'
endif
"----------------------------------------}}}
" neosnippet {{{
"----------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"----------------------------------------}}}


call neobundle#end()
