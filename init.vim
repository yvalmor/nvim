set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" LSP
Plug 'neoclide/coc.nvim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Airline integrations
Plug 'lambdalisue/battery.vim'
Plug 'lambdalisue/wifi.vim'

" Vim Polyglot
Plug 'sheerun/vim-polyglot'

" Vim Fugitive
Plug 'tpope/vim-fugitive'

" Fswitch
Plug 'derekwyatt/vim-fswitch'

" Vista
Plug 'liuchengxu/vista.vim'

" Color scheme
Plug 'joshdick/onedark.vim'

" Nerd fonts
Plug 'ryanoasis/nerd-fonts'

""""""""""""""""""""""""""""""""""""""""""""""""""
" End plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes
""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

set ttimeoutlen=50

" Vim theme
colorscheme onedark

" Vim Airline configuration
let g:airline_theme='onedark'

let g:airline#extensions#battery#enabled = 1
let g:battery#component_format = "%s %v%% %g"

let g:airline#extensions#nerdtree_statusline = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#coc#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
set encoding=utf-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

" Set the time (in milliseconds) spent idle until various actions occur
" In this configuration, it is particularly useful for the tagbar plugin
set updatetime=300

" get more space for messages
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Always show status line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
"set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
if version >= 703
 set colorcolumn=+1
endif

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

set fillchars=vert:│

" Enables syntax highlighting
syntax on

" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

" Allow mouse use in vim
set mouse=a

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=79

" Disable preview window on completion
set completeopt=longest,menuone

" Highlight current line
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" This one is complicated. See :help cinoptions-values for details
set cinoptions=(0,u0,U0,t0,g0,N-s,:0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set "," as map leader
let mapleader = ","

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
noremap j gj
noremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Write as root, when you forgot to sudoedit
cnoreabbrev w!! w !sudo tee % >/dev/null

" map ; to :
noremap ; :

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <leader>m :silent! :make! \| :redraw!<cr>

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
if has("nvim-0.5.0") || has("patch-8.1.1564")
 set signcolumn=number
else
 set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remplaced by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list

nmap <silent> [g <Plug>(coc-diagnostics-preg)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying CodeAction to the selected region.
" Example: '<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-funcobj-i)
omap ic <Plug>(coc-funcobj-i)
xmap ac <Plug>(coc-funcobj-a)
omap ac <Plug>(coc-funcobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-r> <Plug>(coc-range-select)
xmap <silent> <C-r> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Format` command to format current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:Format` command to format current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocListNext<cr>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocListPrev<cr>
" Resume latest coc list
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<cr>

" Mappings for CoCExplorer
nnoremap <space>t :CocCommand explorer
    \ --toggle
    \ <CR>

au BufEnter *.h let b:fswitchdst = "c,cpp,cc"
au BufEnter *.c let b:fswitchdst = "h,hpp,hh,hxx"

nnoremap <silent> <A-o> :FSHere<cr>
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

nnoremap <silent> <A-s> :Vista!!<CR>

