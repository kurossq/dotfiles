scriptencoding utf-8
"----------------------------------------
"システム設定
"----------------------------------------
"エラー時の音とビジュアルベルの抑制。
set noerrorbells
set novisualbell
set visualbell t_vb=
set termencoding=japan
"----------------------------------------
" 表示設定
"----------------------------------------
"ツールバーを非表示
set guioptions-=T

" 縦幅
set lines=35
" 横幅
set columns=80
" 色テーマ
"colorscheme default
colorscheme morning
" クリップボード共有
"set clipboard=unnamed
"フォント設定
"set gfn=IPAゴシック\ 12
set gfn=Ricty\ 13
"印刷用フォント
"set printfont=Monospace\ 12
set printfont=IPAゴシック\ 12

""""""""""""""""""""""""""""""
"Window位置の保存と復帰
""""""""""""""""""""""""""""""
if has('unix')
  let s:infofile = '~/.vim/.vimpos'
else
  let s:infofile = '~/_vimpos'
endif

function! s:SaveWindowParam(filename)
  redir => pos
  exec 'winpos'
  redir END
  let pos = matchstr(pos, 'X[-0-9 ]\+,\s*Y[-0-9 ]\+$')
  let file = expand(a:filename)
  let str = []
  let cmd = 'winpos '.substitute(pos, '[^-0-9 ]', '', 'g')
  cal add(str, cmd)
  let l = &lines
  let c = &columns
  cal add(str, 'set lines='. l.' columns='. c)
  silent! let ostr = readfile(file)
  if str != ostr
    call writefile(str, file)
  endif
endfunction

augroup SaveWindowParam
  autocmd!
  execute 'autocmd SaveWindowParam VimLeave * call s:SaveWindowParam("'.s:infofile.'")'
augroup END

if filereadable(expand(s:infofile))
  execute 'source '.s:infofile
endif
unlet s:infofile
