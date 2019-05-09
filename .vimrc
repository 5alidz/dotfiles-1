" vim-plug as the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'                   " Upgrade vim's omnicomplete
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                    " fuzzy finding with ag
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'          " typescript
Plug 'mattn/gist-vim'                      " quickly put code into a gist
Plug 'mattn/webapi-vim'                    " quickly put code into a gist
Plug 'mxw/vim-jsx'                         " syntax highlighting for react
Plug 'pangloss/vim-javascript'             " do js stuff
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prettier/vim-prettier'               " code formatting
Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'scrooloose/nerdcommenter'            " easy commenting
Plug 'scrooloose/nerdtree'                 " find files by dir tree
Plug 'sonph/onehalf', {'rtp': 'vim/'}      " color theme
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-dispatch'                  " async command line commands
Plug 'tpope/vim-fugitive'                  " git integration
Plug 'tpope/vim-surround'                  " surround with tags
Plug 'vim-airline/vim-airline'             " status bar plugin
call plug#end()

" map leader to spacebar (best thing ever)
let mapleader = ' '

" theme
syntax enable           " Enable code highlighting
set guifont=Monaco:h14
set guioptions-=r
set termguicolors
set background=dark
colorscheme onehalfdark

" line Numbers
set number
set numberwidth=2
set laststatus=2

" search stuff
set incsearch
set gdefault
set visualbell

" characters and movement
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start
set title

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" set one directory for .swp files
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" Airline / Status line options
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" JSX highlighting in regular .js files
let g:jsx_ext_required = 0

" vim-prettier options
noremap <leader>p :PrettierAsync<CR>

" FZF options
let g:fzf_layout = { 'down': '~50%' } " - down / up / left / right
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FindCurrentWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')), 1, <bang>0)
set grepprg=rg\ --vimgrep
noremap <leader>f :FindCurrentWord<CR>
noremap <leader>s :Files<CR>
noremap <leader>b :Buffers<CR>

" NERDCommenter options
let g:NERDCustomDelimiters = { 'less': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' }, 'javascript': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' } }

" NERDTree options
noremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 50

" ALE options
let g:ale_lint_on_text_changed = 'normal'

" Language Server (vim-lsp) options
noremap <leader>r :LspReferences<CR>
noremap <leader>d :LspDefinition<CR>