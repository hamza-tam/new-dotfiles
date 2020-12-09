" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'pbrisbin/vim-mkdir'
  Plug 'tpope/vim-fugitive'

  " Themes
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'mhartington/oceanic-next'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lifepillar/vim-solarized8' 
  " Use release branch (Recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'

  Plug 'mhinz/vim-startify'
  Plug 'jiangmiao/auto-pairs'

  Plug 'dracula/vim'

  Plug 'alvan/vim-closetag'

  Plug 'mattn/emmet-vim'

  Plug 'thesis/vim-solidity'
  Plug 'aklt/plantuml-syntax'

  Plug 'ryanoasis/vim-devicons'
  Plug 'yuttie/comfortable-motion.vim'

  Plug 'tpope/vim-commentary'

  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'

  Plug 'tpope/vim-surround'
  Plug 'vim-test/vim-test'
  Plug 'preservim/tagbar'

  Plug 'honza/vim-snippets'

  Plug 'nicwest/vim-http'
call plug#end()

" coc.nvim Config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-a> :CocAction actions.open<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>

" Custom config
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap <silent> <C-p>  :<C-u>:FZF<CR>
nnoremap <silent> <C-b>  :<C-u>:Buffers<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-f> :CocFix<CR>

set encoding=UTF-8
set number
set linebreak

" important!!
set termguicolors

syntax on
set t_Co=256
" set cursorline
" for dark version
set background=light

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

colorscheme solarized8_low
let g:airline_solarized_bg='dark'
let g:solarized_termcolors=256

set wildmode=longest,list,full
set tabstop=2
set shiftwidth=2
set expandtab
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

let g:NERDTreeWinPos = "right"

let NERDTreeAutoDeleteBuffer = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" Function keys shortcuts
nnoremap <f2> :set paste!<CR>
nnoremap <f3> :set hls!<CR>
nnoremap <f1> :make<CR>

" Moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


if has('nvim')
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd TermOpen * startinsert
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <C-w><C-[> <C-\><C-N>
  nnoremap <C-\> :bel 10sp term://bash<CR>
endif

nmap <F8> :TagbarToggle<CR>

" vim-cp custom plugin
function! Create_cp_env()
  let s:file = @%
  vsp makefile
  wincmd L
  execute "normal! ggdGiall:\<CR>g++ -o prog ".s:file." && ./prog < input.txt > output.txt\<CR>\<CR>clean:\<CR>rm -rf prog makefile input.txt output.txt\<ESC>gg"
  w
  sp output.txt
  w
  set number!
  sp input.txt
  w
  wincmd h
endfunction

nnoremap <leader>cp :call Create_cp_env()<CR>

" Mapping to be able to move line up or down
xnoremap <C-K> :m '<-2<CR>gv=gv
xnoremap <C-J> :m '>+1<CR>gv=gv

" Git shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
packadd! vimspector
