" Nathan L Smith's .vimrc
" http://github.com/smith/vim-config/

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'burnettk/vim-angular'
Plugin 'dag/vim-fish'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'gabebw/vim-spec-runner'
Plugin 'gcmt/wildfire.vim'
Plugin 'gmarik/vundle'
Plugin 'guns/vim-clojure-static'
Plugin 'idanarye/vim-merginal'
Plugin 'int3/vim-extradite'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'rizzatti/dash.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-z>'
Plugin 'junegunn/seoul256.vim'
let g:seoul256_background = 233
" Track the engine.
"
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wellle/tmux-complete.vim'
" This must be loaded after vim-ruby
Plugin 'file:///Users/nathansmith/Projects/vim-chef'

Plugin 'Align'
Plugin 'csv.vim'
Plugin 'LargeFile'
Plugin 'TaskList.vim'
Plugin 'TwitVim'
Plugin 'ZoomWin'
call vundle#end()            " required
filetype plugin indent on    " required

" General options
set autoread
set hidden
set incsearch
set ignorecase
set lazyredraw
set mouse=a
set nobackup
set noswapfile
set smartcase
set spell
set spelllang=en_us
set showcmd
set splitbelow
set splitright
set switchbuf=useopen
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set history=1000
set pastetoggle=<F2>
set shortmess=at
set tags=./tags;/
set t_Co=256

" Status line
set laststatus=2 " Always show
" filename [modified (+ or -)] [fugitive info] [filetype]              row,col %
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Use :w!! to save with sudo if you're editing a readonly file
cmap w!! w !sudo tee % >/dev/null

" Key Mappings
let mapleader=","
let g:mapleader=","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree toggle with ,`
map <leader>` :NERDTreeToggle<CR>

" TagBar with ,\
map <leader>\ :TagbarToggle<CR>

" Resize window to 80 width with ,8
map <leader>8 :vertical resize 80<CR>

" :Ack with ,a
map <leader>a :Ack

" :Align = with ,=, :Align and sort with ,+
map <leader>= :Align =<CR>

" CoffeeCompile
vmap <leader>s <esc>:'<,'>:CoffeeCompile<CR>
map <leader>s :CoffeeCompile<CR>
" Given :C NN, compile the coffeescript and go to the line in the JS
command! -nargs=1 C CoffeeCompile | :<args>

" ,d for dispatch
"map <leader>d :Dispatch<CR>
map <Leader>d <Plug>RunCurrentSpecFile

" ,f to find in nerdtree
map <leader>f :NERDTreeFind<CR>

" Dash
nmap <silent> <leader>h <Plug>DashSearch
nmap <silent> <leader>H <Plug>DashGlobalSearch

" <CTRL-P> for ctrlp.vim
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
" (stolen from Janus)
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" remap shift tab to be omni-complete
inoremap <S-TAB> <C-X><C-O>

" use <C-W><C-Z> for zoomwin
nmap <C-W>z  <Plug>ZoomWin

" GUI options
if has("gui_running")
  " No menus and no toolbar
  set guioptions-=m
  set guioptions-=T

  " Left handed scrollbar
  set guioptions-=r
  set guioptions+=l

  set co=80
  set lines=45
endif

" Appearance
set ruler
set title
set wrap
if exists("+colorcolumn")
  set colorcolumn=81
endif
set cursorline
set scrolloff=3
colorscheme solarized

" Fix folded highlight in terminal
highlight Folded ctermfg=Yellow ctermbg=NONE
highlight FoldColumn ctermfg=Yellow ctermbg=NONE

" Highlight trailing whitespace
highlight ExtraWhitespace guibg=DarkCyan ctermbg=Blue
au ColorScheme * highlight ExtraWhitespace guibg=DarkCyan ctermbg=Blue
au BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
au BufWrite * match ExtraWhitespace /\s\+$\| \+\ze\t/

" Spelling highlights
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

" Use ag for :Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

function! Indent4Spaces()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

function! Indent2Spaces()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

" bats!
au BufRead,BufNewFile,BufWrite {*.bats} set ft=sh

" CSS-type things
au BufRead,BufNewFile,BufWrite {*.less} set ft=css

" Git shortcuts
function! s:GitCheckout(...)
  :silent execute 'Git checkout ' . a:1 . ' > /dev/null 2>&1' | redraw!
endfunction
command! -nargs=1 Gc call s:GitCheckout(<f-args>)
" http://robots.thoughtbot.com/post/48933156625/5-useful-tips-for-a-better-commit-message
au Filetype gitcommit setlocal spell textwidth=72

" Markdown
au BufRead,BufNewFile,BufWrite {*.markdown,*.md,*.mdk} set ft=markdown
au FileType markdown setlocal makeprg=ghpreview\ %
au BufRead,BufNewFile,BufWrite {*.textile} set ft=textile

" Property lists
au BufRead,BufNewFile,BufWrite {*.plist} set ft=xml

" Syntastic mods
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/.coffeelintrc"

" Use ruby syntax for additional ruby types
au BufRead,BufNewFile,BufWrite {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" For vim-spec-runner/dispatch
let g:spec_runner_dispatcher = 'Dispatch {command}'

" Indent-based folding
au BufRead,BufNewFile,BufWrite {*.json,,*.py,*.coffee,*.yaml,*.yml} set foldmethod=indent

" FIXME: This fails when you have Prototype.js style string inteporation like
"        #{prop} in a string
function! JavaScriptFold()
  setl foldmethod=syntax
  setl foldlevelstart=99
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

" Lisp
au BufRead,BufNewFile,BufWrite {*.scm,*.scheme} set ft=lisp
au BufRead,BufNewFile,BufWrite {*.cljs} set ft=clojure
au BufRead,BufNewFile,BufWrite {*.clj,*.cljs} set nospell
let g:vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1           " Rainbow parentheses'!

" Make gf work for Common JS and AMD modules
au FileType javascript setlocal suffixesadd=.coffee,.js,.jade
au FileType coffee setlocal suffixesadd=.coffee ",.js,.jade

" FIXME: When js in rails projects is being edited, it uses 2 spaces. Figure
"        out how to not have rails.vim override this
au FileType javascript call Indent2Spaces()
au FileType javascript call JavaScriptFold()
au FileType coffee,javascript setlocal makeprg=npm\ test
au FileType javascript setl fen
au FileType javascript setl foldlevel=99
au FileType json setlocal equalprg=jsonlint
let g:vim_json_syntax_conceal = 0

" PHP
let php_folding=1
au FileType php call Indent4Spaces()
au FileType php setl foldlevel=99

" Python
au FileType python call Indent4Spaces()

" MacVim
if has("gui_macvim")
  set transp=1
  set anti enc=utf-8 gfn=Source_Code_Pro:h16,Menlo:h14,Monaco:h14
  set fuoptions=maxvert,maxhorz

  " Copy/paste on mac
  " (http://www.drbunsen.org/text-triumvirate.html#vim)
  " Yank text to the OS X clipboard
  noremap <leader>y "*y
  noremap <leader>yy "*Y
  " Preserve indentation while pasting text from the OS X clipboard
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
endif

" Windows
if has("win32")
    " Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V and CTRL-z
    source $VIMRUNTIME/mswin.vim
    set guifont=Consolas:h13:cANSI,Anonymous\ Pro:h13:cANSI
endif

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" See http://robots.thoughtbot.com/faster-grepping-in-vim/ for the below

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>
