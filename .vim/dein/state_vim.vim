if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/ibuki/.vimrc', '/Users/ibuki/.vim/dein/dein_plugins.toml', '/Users/ibuki/.vim/dein/dein_plugins_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/ibuki/.vim/dein'
let g:dein#_runtime_path = '/Users/ibuki/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/ibuki/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/ibuki/.vim/deinrepos/github.com/Shougo/dein.vim/,/Users/ibuki/.vim/dein/,/Users/ibuki/.vim,/Users/ibuki/.vim/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,/Users/ibuki/.vim/after,/Users/ibuki/.vim/dein/.cache/.vimrc/.dein/after'
set t_Co=256
set background=dark
let g:hybrid_use_Xresources = 1
au MyAutoCmd VimEnter * nested colorscheme hybrid
syntax on
autocmd dein-events InsertCharPre * call dein#autoload#_on_event("InsertCharPre", ['neosnippet.vim'])
