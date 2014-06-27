" Load Vundle. Manages all of the bundles.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Specify all bundles.
Plugin 'gmarik/Vundle.vim'

" Syntax and language improvements.
Plugin 'derekwyatt/vim-scala'
Plugin 'helino/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'mxw/vim-jsx'

" General.
Plugin 'Lokaltog/vim-distinguished'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Wolfy87/vim-enmasse'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'marijnh/tern_for_vim'
Plugin 'mhinz/vim-signify'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'walm/jshint.vim'
Plugin 'FindInNERDTree'
Plugin 'scrooloose/nerdtree'
Plugin 'YankRing.vim'
Plugin 'nodeunit.vim'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'vim-coffee-script'
 autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent 
 autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
 autocmd QuickFixCmdPost * nested cwindow | redraw!
 autocmd BufWritePost *.coffee silent make! --output output
Plugin 'thoughtbot/vim-rspec'
Plugin 'geekjuice/vim-mocha' 
 let g:mocha_coffee_command = ":Dispatch mocha --compilers 'coffee:coffee-script/register' {spec}" 
 " vim-rspec mappings
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

Plugin 'justinmk/vim-sneak'
  let g:sneak#streak = 1

Plugin 'Raimondi/delimitMate'
  let delimitMate_expand_cr=1

Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/snippets"

Plugin 'Valloric/YouCompleteMe'
  let g:ycm_add_preview_to_completeopt=0
  let g:ycm_confirm_extra_conf=0
  set completeopt-=preview

Plugin 'bling/vim-airline'
  let g:airline#extensions#tabline#enabled=1
  let g:airline_left_sep=''
  let g:airline_right_sep=''

Plugin 'edkolev/promptline.vim'
  let g:promptline_powerline_symbols=0
  " Rest of config at bottom so it has access to autoload.

Plugin 'embear/vim-localvimrc'
  let g:localvimrc_ask=0
  let g:localvimrc_sandbox=0

Plugin 'kien/ctrlp.vim'

Plugin 'kien/rainbow_parentheses.vim'
  let g:rbpt_colorpairs = [
    \['blue', '#FF6000'],
    \['cyan', '#00FFFF'],
    \['darkmagenta', '#CC00FF'],
    \['yellow', '#FFFF00'],
    \['red', '#FF0000'],
    \['darkgreen', '#00FF00'],
    \['White', '#c0c0c0'],
    \['blue', '#FF6000'],
    \['cyan', '#00FFFF'],
    \['darkmagenta', '#CC00FF'],
    \['yellow', '#FFFF00'],
    \['red', '#FF0000'],
    \['darkgreen', '#00FF00'],
    \['White', '#c0c0c0'],
    \['blue', '#FF6000'],
    \['cyan', '#00FFFF'],
    \['darkmagenta', '#CC00FF'],
    \['yellow', '#FFFF00'],
    \['red', '#FF0000'],
    \['darkgreen', '#00FF00'],
    \['White', '#c0c0c0'],
  \]

  let g:rbpt_max = 21

  augroup RainbowParentheses
    autocmd!
    autocmd VimEnter * RainbowParenthesesActivate
    autocmd BufEnter * RainbowParenthesesLoadRound
  augroup END

Plugin 'nathanaelkane/vim-indent-guides'
  nnoremap <silent> <leader>i :IndentGuidesToggle<CR>
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_auto_colors=0

  augroup IndentGuideColors
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
  augroup END

Plugin 'rking/ag.vim'
  nnoremap <silent> <leader>a :set opfunc=<SID>AgMotion<CR>g@
  xnoremap <silent> <leader>a :<C-U>call <SID>AgMotion(visualmode())<CR>

  nnoremap <bs> :Ag! '\b<c-r><c-w>\b'<cr>
  xnoremap <silent> <bs> :<C-U>call <SID>AgMotion(visualmode())<CR>

  function! s:CopyMotionForType(type)
    if a:type ==# 'v'
      silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
      silent execute "normal! `[v`]y"
    endif
  endfunction

  function! s:AgMotion(type) abort
    let reg_save = @@
    call s:CopyMotionForType(a:type)
    execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"
    let @@ = reg_save
  endfunction

Plugin 'scrooloose/syntastic'
  let g:syntastic_check_on_open=1
  let g:syntastic_mode_map={
    \'mode': 'active',
    \'active_filetypes': [],
    \'passive_filetypes': ['html', 'cpp', 'java', 'scala']
  \}

Plugin 'sjl/gundo.vim'
  nnoremap <silent> <leader>u :GundoToggle<CR>

" Enable some syntax settings that had to be disabled for Vundle.
call vundle#end()
filetype plugin indent on


" Promptline config uses autoload which is only setup by this point.
let g:promptline_preset = {
  \'a' : [ promptline#slices#user() ],
  \'b' : [ promptline#slices#jobs(), promptline#slices#vcs_branch() ],
  \'c' : [ promptline#slices#cwd() ],
  \'warn' : [ promptline#slices#last_exit_code() ]
\}
