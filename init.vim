" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|


let g:python3_host_prog = '/usr/bin/python3'


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus

let &t_ut=''
set autochdir

" set path+=~/linuxptp/**7

" {{{========================= Basic setting =============================
" ===
" ===
set exrc
set secure
" set number
" set relativenumber
" set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
" set nolist
set list
set listchars=tab:\|\ ,trail:▫
"禁止产生临时文件
"sdad
set noundofile
set nobackup
set noswapfile

set scrolloff=4
set timeoutlen=500
set viewoptions=cursor,folds,slash,unix
set nowrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set noignorecase "treat case as difference in search mode
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100 "set a line to show the recommend line length
hi ColorColumn ctermbg=blue
set updatetime=100
set virtualedit=block
set autoread
set autowriteall
set mouse=nvi
" set mouse=ni
" set termguicolors

set background=dark
" true color enable
if has("termguicolors")
	" enable true color
	set termguicolors
endif
if &term =~# '^screen'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set foldenable
set foldmethod=marker

filetype plugin on"}}}

" Restore the last quit position when open file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 设置跳出自动补全的括号 {{{
func SkipPair()
	if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == '>' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getli
		return "\<ESC>la"
	else
		return "\t"
	endif
endfunc

inoremap jj <c-r>=SkipPair()<CR>
"}}}
" 常规模式下输入清除行尾 ^M 符号{{{
nmap <space>dM :%s/\r$//g<CR>:noh<CR>
"}}}
" 删除行尾空格 和 Tab{{{
nmap <space>ds :%s/\s\+$//g<CR>:noh<CR>
"}}}
" 删除空行{{{
nmap <space>dl :g/^s*$/d<CR>
"}}}

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1

autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

nn <ESC><ESC> :cclose<CR>
"{{{ === Basic Mappings
" ===
" ===
" Set <LEADER>
let mapleader=","

" Save & quit
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>


" Open the vimrc file anytime
noremap <space>rc :e $HOME/.config/nvim/init.vim<CR>

" Open README.md
noremap <leader>he :vs $HOME/.config/nvim/README.md<CR>
noremap <leader>hd :vs $HOME/.config/nvim/Man<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>stt :%s/    /\t/g
" vnoremap <LEADER>tt :s/    /\t/g

" Tab to space
nnoremap <LEADER>tts :%s/\t/    /g
" Folding
" noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>


" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" ===
" === copy/paset between vim and system clipboard
" ===
map <SPACE>pp "+p
map <SPACE>yy "+y
vmap <SPACE>yy "+y

" switch mouse state
noremap <space>ma :set mouse=a<CR>
noremap <space>mv :set mouse=v<CR>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>wj <C-w>j
" noremap <LEADER>wh <C-w>h
" noremap <LEADER>wl <C-w>l
nmap <space>wh :vertical res +30<CR>
nmap <space>wl :vertical res -30<CR>
nmap <space>wj :res +15<CR>
nmap <space>wk :res -15<CR>


" Disable the default s key
noremap s <nop>
" Disable the default q key
noremap q <nop>
" start/stop reocrd macro
noremap sq q

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>



" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tab split<CR>
noremap tU :tabe<CR>
" Motion around tabs with tn and ti
noremap to :-tabnext<CR>
noremap tp :+tabnext<CR>
" Motion the tabs with tmn and tmi
noremap <A-j> :-tabmove<CR>
noremap <A-k> :+tabmove<CR>

" Close the tab
noremap tc :tabclose<CR>

"motion between buffers
nn bn :bn<CR>
nn bp :bp<CR>
"
" Press space twice to jump to the next '' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


" find and replace
noremap \s :%s///g<left><left><left>

" format python
" map <F4> :%!python -m json.tool<CR>

" press F9 to show hlgroup
" function! SynGroup()
	" let l:s = synID(line('.'), col('.'), 1)
	" echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
" endfun
"
" nmap <F9> :call SynGroup()<CR>

nmap <F10> ggVG=

nmap <SPACE><F12> :call lsp#disable()<CR>
nmap <F12> :call lsp#enable()<CR>

"}}}

"{{{ ========================= Install Plugins with Vim-Plug =============================
"
call plug#begin('$HOME/.config/nvim/plugged')
" Welcome page change
Plug 'mhinz/vim-startify'

" themes and appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'AlessandroYorba/Alduin'
" Plug rakr/vim-two-firewatch
" Plug Badacadabra/vim-archery
"
" A Vim Applications Calendar
Plug 'itchyny/calendar.vim'

" Git relative
Plug 'airblade/vim-gitgutter'
Plug 'shjinyuan/vim-fugitive'

" vim-lsp with ccls
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'dense-analysis/ale'
" Plug 'rhysd/vim-lsp-ale'
"
" Plug 'neovim/nvim-lspconfig' " not used in daily life, need to config further
"
" async complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" code navigation
Plug 'jsfaint/gen_tags.vim'
Plug 'joereynolds/gtags-scope'

" Plug 'neoclide/coc.nvim'

" This is a plugin for Vim to dim inactive windows
" Plug 'blueyed/vim-diminactive'


" snippets
Plug 'maralla/completor.vim' "prompt snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" powerful commenter
Plug 'preservim/nerdcommenter'

" system navigation
Plug 'preservim/nerdtree'
Plug 'yegappan/mru'
Plug 'junegunn/fzf'

" parentheses and brackets
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Translator
Plug 'voldikss/vim-translator'

" Tips for key's map
Plug 'liuchengxu/vim-which-key'

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" support math latex
" Plug 'iamcco/mathjax-support-for-mkdp'

" Auto save
Plug '907th/vim-auto-save'

" multi cursor support
" Plug 'terryma/vim-multiple-cursors'

"  buffer managerment
Plug 'bsdelf/bufferhint'

" tagbar which repleace taglist
Plug 'preservim/tagbar'

" sliver search support
Plug 'rking/ag.vim'

call plug#end()
"}}}

"{{{ ========================= Plugin Setting and Key Mappings =====================================
"
" Airline setting to show tabs ontop
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1

" colorscheme blue
" colorscheme darkblue
" colorscheme delek
colorscheme desert
" colorscheme elflord
" colorscheme evening
" colorscheme habamax
" colorscheme industry
" colorscheme koehler
" colorscheme morning
" colorscheme murphy
" colorscheme pablo
" colorscheme peachpuff
" colorscheme quiet
" colorscheme ron
" colorscheme shine
" colorscheme slate
" colorscheme torte
" colorscheme zellner



""
"" === vim-lsp with ccls setting
""
let g:lsp_auto_enable = 0
if executable('ccls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'ccls',
				\ 'cmd': {server_info->['ccls']},
				\ 'root_uri': {server_info->lsp#utils#path_to_uri(
				\				lsp#utils#find_nearest_parent_file_directory(
				\								lsp#utils#get_buffer_path(),
				\		['.ccls', 'compile_commands.json', '.git/']
				\	))},
				\ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
				\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				\ })
endif
" Key bindings for vim-lsp.
nn <silent> <M-d> :vs +LspDefinition<cr>
nn <silent> <M-r> :vs +LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :vs +LspWorkspaceSymbol<cr>
nn <silent> <M-s> :vs +LspDocumentSymbol<cr>

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-j> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-k> lsp#scroll(-4)

	let g:lsp_format_sync_timeout = 1000
	" autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormAtSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"
" === gen_tags.vim setting
"

let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#gtags_auto_updagen = 1
"
let g:gen_tags#root_marker = ".git"
let g:gen_tags#gtags_opts = ['-c', '--verbose']

let g:gen_tags#gtags_default_map = 0

map <LEADER>sc :cs find c <C-R>=expand('<cword>')<CR><CR>
map <LEADER>sd :cs find d <C-R>=expand('<cword>')<CR><CR>
map <LEADER>se :cs find e <C-R>=expand('<cword>')<CR><CR>
map <LEADER>sf :cs find f <C-R>=expand('<cfile>')<CR><CR>
map <LEADER>sg :cs find g <C-R>=expand('<cword>')<CR><CR>
map <LEADER>si :cs find i <C-R>=expand('<cfile>')<CR><CR>
map <LEADER>ss :cs find s <C-R>=expand('<cword>')<CR><CR>
map <LEADER>st :cs find t <C-R>=expand('<cword>')<CR><CR>

map <LEADER>vc :vert scs find c <C-R>=expand('<cword>')<CR><CR>
map <LEADER>vd :vert scs find d <C-R>=expand('<cword>')<CR><CR>
map <LEADER>ve :vert scs find e <C-R>=expand('<cword>')<CR><CR>
map <LEADER>vf :vert scs find f <C-R>=expand('<cfile>')<CR><CR>
map <LEADER>vg :vert scs find g <C-R>=expand('<cword>')<CR><CR>
map <LEADER>vi :vert scs find i <C-R>=expand('<cfile>')<CR><CR>
map <LEADER>vs :vert scs find s <C-R>=expand('<cword>')<CR><CR>
map <LEADER>vt :vert scs find t <C-R>=expand('<cword>')<CR><CR>
"
"
" NERDTREE setting

nmap - :NERDTreeToggle<CR>


"
" === nerdcommenter setting
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"
" ===asyncomplete setting
"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


"
" === translater setting
"
" let g:translator_target_lang = 'zh'
let g:translator_default_engines = ['bing']
" Create default mappings
" Echo translation in the cmdline
nmap <silent> <Leader>te <Plug>Translate
vmap <silent> <Leader>te <Plug>TranslateV
" Display translation in a window
" nmap <silent> <Leader>te <Plug>TranslateW
" vmap <silent> <Leader>te <Plug>TranslateWV
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX


"
" === rainbow_parentheses.vim setting
"
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"
" === gitgutter setting
"
let g:gitgutter_max_signs = -1
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
function! NextHunkAllBuffers()
	let line = line('.')
	GitGutterNextHunk
	if line('.') != line
		return
	endif

	let bufnr = bufnr('')
	while 1
		bnext
		if bufnr('') == bufnr
			return
		endif
		if !empty(GitGutterGetHunks())
			GitGutterNextHunk
			return
		endif
	endwhile
endfunction

function! PrevHunkAllBuffers()
	let line = line('.')
	GitGutterPrevHunk
	if line('.') != line
		return
	endif

	let bufnr = bufnr('')
	while 1
		bprevious
		if bufnr('') == bufnr
			return
		endif
		if !empty(GitGutterGetHunks())
			normal! G
			GitGutterPrevHunk
			return
		endif
	endwhile
endfunction

nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>

"
" === vim-which-key setting
"
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


"
"==== completor setting
"
" let g:completor_clang_binary = '/usr/bin/clang'

"
"==== UltriSnips setting
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ActivateAddons vim-snippets snipmate

let g:completor_clang_binary = '/usr/bin/clang'

"
"==== auto save plugin_setting
"
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "CompleteDone"]

"
"==== bufferhint setting
"
nnoremap _ :call bufferhint#Popup()<CR>

"
"==== MRU setting
"
" let MRU_Window_Height = 35
" nnoremap \ :vertical botright MRUToggle<CR>
let MRU_Window_Height = 15
nnoremap \ :botright MRUToggle<CR>

"
"==== tagbar setting
"
let g:tagbar_position = 'leftabove vertical'
nnoremap <silent> <F8> :TagbarToggle<CR>

"================================================================================
" Plugin setting END
"================================================================================
"{{{ TODO check the autocmd meaning here
autocmd! bufwritepost $HOME/.config/nvim/init.vim  so <afile>
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

"}}}
"====================================
"			code assist
"====================================
execute 'source ~/.config/nvim/utility/setTitle.vim'
" change cursor mode ,not work in nvim
" - entered insert mode
" let &t_SI = "^[[5 q^[]12;Magenta\007" " blinking bar (Ss) in magenta (Cs)
" - entered replace mode
" let &t_SR = "^[[0 q^[]12;Red\007" " blinking block (Ss) in red (Cs)
" - leaving insert/replace mode
" let &t_EI = "^[[2 q^[]112\007" " terminal power-on style (Se) and colour (Cr)
autocmd InsertEnter,InsertLeave * set cul!
" set guicursor+=n-v-c:blinkon0
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
" \,sm:block-blinkwait175-blinkoff150-blinkon175

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
"
"===================================
" Cool tricks
"===================================
" insert time
ab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


let g:ascii = [
			\ '        __',
			\ '.--.--.|__|.--------.',
			\ '|  |  ||  ||        |',
			\ ' \___/ |__||__|__|__|',
			\ ''
			\]
" let g:startify_custom_header =
" \ startify#pad(g:ascii + startify#fortune#boxed())
let g:startify_custom_header =
			\ 'startify#pad(g:ascii)'

let g:startify_skiplist = ["init.vim$"]


"{{{
" custom highlight setting
"
"
" ======== Gitgutter sign
" highlight GitGutterChangeInvisible guifg=Red
" highlight GitGutterDeleteInvisible guifg=Red
highlight GitGutterAdd		guifg=Green
highlight GitGutterDelete guifg=Red
highlight GitGutterChange guifg=Blue
"
"
"========== Diff Mode
" hi DiffAdded cterm=bold ctermfg=6 ctermbg=0  gui=none guifg=0 guibg=white
" hi DiffRemoved cterm=bold ctermfg=6 ctermbg=0  gui=none guifg=0 guibg=white
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Green
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Blue
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=black guibg=Yellow
"
"
"========== Menu for selection
hi Pmenu ctermfg=10 ctermbg=17 guibg=Black guifg=Green
hi PmenuSel ctermfg=10 ctermbg=17 guibg=Gray guifg=White
"}}}

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }



" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

let g:fzf_action = {
			\ 'ctrl-q': function('s:build_quickfix_list'),
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }


" ActiveWindow: set focus window {{{1
"colorcolumn {{{2
let g:AutoResizeFocusWindow=1
" ActiveWindow
function s:Set_focus_window()
	"after entering another window, set cc=80
	" set cc=80
	"hi CursorLineNr term=bold ctermfg=Yellow
	if g:AutoResizeFocusWindow == 1
		if bufname("%") == "__Tagbar__.1"
		elseif bufname("%") == "NERD_tree_1"
		else
			"resize the focus window when the window size < 86
			if winwidth(0) <= 86
				vertical res 99
				"echo "The current window has " . winwidth(0) . " columns."
			endif
		endif
		" display current window's bufname, FIXME: ,f1
		"echo bufname("%")
	endif

	augroup BgHighlight_focus
		" Highlight the text line of the cursor with CursorLine 'hl-CursorLine'.
		set cul
		set cuc
		set relativenumber
		set number
		syntax on
	augroup END
	checktime
endfunction


" NonActiveWindow
function s:Set_lose_focus_window()
	augroup BgHighlight_loss_fucos
		set nocul
		set nocuc
		set norelativenumber
		set nonumber
		syntax clear
	augroup END
	checktime
endfunction

" define a shortcut key for enabling/disabling auto resize focus window:
nnoremap  <leader>fx :exe "let g:AutoResizeFocusWindow=exists(\"g:AutoResizeFocusWindow\")?g:AutoResizeFocusWindow*-1+1:1"<CR>

" 不是 vimdiff 时，自动改变窗口大小; vimdiff 窗口不自动改变大小
if &diff == 0
	autocmd WinEnter,BufEnter * call s:Set_focus_window()
	autocmd WinLeave,BufLeave * call s:Set_lose_focus_window()
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"It will open a vimdiff-like window with the current buffer and the underlying file highlighting all of the changes between the two.
" :h vimrc_example
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			\ | wincmd p | diffthis

" :map messages output to ~/.vim/map.txt
command -nargs=? Rmap redir! > ~/.vim/my_help/key_map.txt | silent map | redir END

" set cscopetag " 使用 cscope 作为 tags 命令
" set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"
"
"gtags.vim 设置项
" let GtagsCscope_Auto_Load = 1
" let CtagsCscope_Auto_Map = 1
" let GtagsCscope_Quiet = 1

hi CursorLine gui=underline cterm=underline guifg=revert
match WhitespaceEOL /\s\+$/
highlight WhitespaceEOL ctermbg=red guibg=red

" source $HOME/.config/nvim/enhance/self_quotaSelect.vim

vnoremap <C-S> "+y

" inoremap <Leader>y <C-R>=@+<CR>
inoremap <Leader>y <C-R>=Mypf()<CR>
function! Mypf()
	return printf("clipboard=%s",@+)
endfunction

inoremap <CR> <C-R>=Caculate()<CR>
let s:caculate_dict={}
function s:callback(jd,data,event) dict
  let msg=join(a:data)
  let self.data .= msg
endfunction
let s:caculate_dict.on_stdout=function("s:callback")
" on_stderr on_exit
function! Caculate()
  let buf=getline(".")
  let n=2
  let ps=col(".")-1
  'expr=
  if (ps<4 || buf[ps-1] isnot '=')
    return "\<CR>"
  endif
  while( 1 )
    if( ps-n<0||buf[ps-n] is "'" )
      break
    endif
    let n+=1
  endwhile
  let expr=buf[ps-n+1:ps-2]
  let cmd="wolframscript -code "."'".expr."'"
  let s:caculate_dict.data=""
  let job_id=jobstart(cmd,s:caculate_dict)
  let status=jobwait([job_id],20000)[0]==-1
  if status
    return "timeout"
  endif
  return s:caculate_dict.data
endfunction

set expandtab
set cursorcolumn
set ofu=syntaxcomplete#Complete
highlight mycolor1 ctermfg=blue ctermbg=yellow
highlight mycolor2 ctermfg=160 ctermbg=119
highlight cg1 ctermfg=yellow
highlight cg2 ctermfg=3
highlight cg3 ctermfg=13
highlight cg4 ctermfg=228
highlight cg5 ctermfg=white
highlight cg6 ctermfg=blue
call matchadd("cg1","Vimscript")
call matchadd("cg2","⇒ ")
call matchadd("cg3","→ ")
call matchadd("cg4","☞ ")
call matchadd("cg5","(",100)
call matchadd("cg6",")",100)
inoremap <silent>` <C-X><C-O>
augroup newrc
  autocmd!
  autocmd BufRead * highlight Comment ctermfg=green ctermbg=NONE
augroup END
highlight MsgArea ctermbg=4
highlight cursorline   cterm=NONE ctermbg=240 ctermfg=NONE
highlight CursorColumn cterm=NONE ctermbg=240 ctermfg=NONE
highlight Visual term=reverse ctermbg=191 ctermfg=blue
let g:bufcount=0
function! SwitchBuf()
  if g:bufcount%2==0
    w
    bn
  else
    w
    bp
  endif
  let g:bufcount+=1
endfunction
inoremap <expr> <CR> pumvisible()? "\<C-n>":"\<CR>"
noremap t :call SwitchBuf()<CR>

function! Delspace(ch)
  let c=nr2char(getchar(0))
  return (c =~ a:ch)?'':c
endfunction

let g:snippt_list=[]

inoremap <tab> <C-R>=SnipptTaggle()<CR>
inoremap <F9> <C-R>=<SID>snippt_navigate()<CR>
vnoremap <expr><CR> ConTract()
function! ConTract()
  if (col(".")-col("v")>0)
    return "holo"
  endif
  return "loh"
endfunction
function! SnipptTaggle()
  let buf=getline(".")
  let ln=col(".")-2
  let n=1
  let c=''
  while ln>=0 && n<=3
    let c=buf[ln].c
    if n==1
      "\Note\
    elseif n==2
      if c is# "if"
        call s:snippt_if()
        call <SID>snippt_navigate()
        break
      elseif c is# "fu"
        call s:snippt_func()
        call <SID>snippt_navigate()
        break
      elseif c is# "wh"
        call s:snippt_while()
        call <SID>snippt_navigate()
        break
      elseif c is# "fo"
        call s:snippt_for()
        call <SID>snippt_navigate()
        break
      elseif c is# "fe"
        call s:snippt_fe()
        call <SID>snippt_navigate()
        break
      endif
    else
      "\Note\
    endif
    let ln-=1
    let n+=1
  endwhile
  return ''
endfunction

function s:snippt_if()
  let ln=line(".")
  let snippt_dict={}
  let snippt_dict.total=3
  let snippt_dict.complnum=0
  let snippt_dict.limit=5
  let snippt_dict.content=
\ [["|condition|",10],["|text|",5],
\ ["|text_else|",10]]
  call add(g:snippt_list,snippt_dict)
  let idt=indent(ln)
  let idt_string=''
  while idt>0
    let idt_string.=' '
    let idt-=1
  endwhile
  call setline(ln,idt_string . "if( |condition| )")
  call append(ln,[idt_string."  |text|",idt_string."else",idt_string."  |text_else|",idt_string."endif"])
endfunction

function s:snippt_func()
  let ln=line(".")
  let snippt_dict={}
  let snippt_dict.total=2
  let snippt_dict.complnum=0
  let snippt_dict.limit=3
  let snippt_dict.content=
\ [["|fname|",6],["|content|",8]]
  call add(g:snippt_list,snippt_dict)
  call setline(ln,"function! |fname|")
  call append(ln,["  |content|","endfunction"])
endfunction

function s:snippt_while()
  let ln=line(".")
  let snippt_dict={}
  let snippt_dict.total=2
  let snippt_dict.complnum=0
  let snippt_dict.limit=3
  let snippt_dict.content=
\ [["|condition|",10],["|content|",8]]
  call add(g:snippt_list,snippt_dict)
  let idt=indent(ln)
  let idt_string=''
  while idt>0
    let idt_string.=' '
    let idt-=1
  endwhile
  call setline(ln,idt_string."while( |condition| )")
  call append(ln,[idt_string."  |content|",idt_string."endwhile"])
endfunction

function s:snippt_for()
  let ln=line(".")
  let snippt_dict={}
  let snippt_dict.total=2
  let snippt_dict.complnum=0
  let snippt_dict.limit=3
  let snippt_dict.content=
\ [["|List|",5],["|content|",8]]
  call add(g:snippt_list,snippt_dict)
  let idt=indent(ln)
  let idt_string=''
  while idt>0
    let idt_string.=' '
    let idt-=1
  endwhile
  call setline(ln,idt_string."for item in |List|")
  call append(ln,[idt_string."  |content|",idt_string."endfor"])
endfunction

function s:snippt_fe()
  let ln=line(".")
  let snippt_dict={}
  let snippt_dict.total=2
  let snippt_dict.complnum=0
  let snippt_dict.limit=3
  let snippt_dict.content=
\ [["|condition|",10],["|content|",8]]
  call add(g:snippt_list,snippt_dict)
  let idt=indent(ln)
  let idt_string=''
  while idt>0
    let idt_string.=' '
    let idt-=1
  endwhile
  call setline(ln,idt_string."if( |condition| )")
  call append(ln,[idt_string."  |content|",idt_string."endif"])
endfunction

function <SID>snippt_navigate()
  if len(g:snippt_list)==0
    return "<F9>"
  endif
  let snippt_item=g:snippt_list[-1]
  let ln=line(".")
  let lmax=line("$")
  let expr=snippt_item.content[snippt_item.complnum][0]
  let idn=snippt_item.content[snippt_item.complnum][1]
  let snippt_item.complnum+=1
  while ln<=lmax
    let tmp=match(getline(ln),expr)
    if tmp>0
      call feedkeys("\<ESC>")
      call cursor(ln,tmp+2)
      call feedkeys(printf("v%dl\<C-g>",idn))
      break
    else
      let ln+=1
    endif
  endwhile
  if snippt_item.complnum>=snippt_item.total
    call remove(g:snippt_list,-1)
  endif
  return ''
endfunction

call matchadd("mycolor2","|condition|")
call matchadd("mycolor1","|text|")
call matchadd("mycolor1","|text_else|")
call matchadd("mycolor2","|fname|")
call matchadd("mycolor1","|content|")
call matchadd("mycolor2","|List|")
noremap <expr>s Mat()
function! Mat()
  let buf=getline(".")
  let q1=0
  let q2=0
  let p1=0
  let p2=0
  let n=0
  let qlist=[]
  while 1
    let c=buf[n]
    if c is ''
      break
    endif
    if c is '"'
      let q1+=1
      if q1%2==0
        call add(qlist,p1)
        call add(qlist,n)
        if p2>p1
          let q2=0
        endif
      endif
      let p1=n
    elseif c is "'"
      let q2+=1
      if q2%2==0
        call add(qlist,p2)
        call add(qlist,n)
        if p1>p2
          let q1=0
        endif
      endif
      let p2=n
    endif
    let n+=1
  endwhile
  let md=mode()
  if md is# 'v'
    let mf=''
    let oft=1
  elseif md is# 'n'
    let mf='v'
    let oft=0
  else
    return ''
  endif
  let bpos=col("v")-1
  let epos=col(".")-1
  let endl=col("$")-2
  let f1=0
  let f2=0
  let f3=0
  let f4=0
  let n=oft
  while bpos-n>=0
    let c=buf[bpos-n]
    if c is ')' && n>0
      let f1-=1
    elseif c is '('
      let f1+=1
      if f1==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '(' && m>0
            let f1+=1
          elseif s is ')'
            let f1-=1
            if f1==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is ']' && n>0
      let f2-=1
    elseif c is '['
      let f2+=1
      if f2==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '[' && m>0
            let f2+=1
          elseif s is ']'
            let f2-=1
            if f2==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '}' && n>0
      let f3-=1
    elseif c is '{'
      let f3+=1
      if f3==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '{' && m>0
            let f3+=1
          elseif s is '}'
            let f3-=1
            if f3==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '>' && n>0
      let f4-=1
    elseif c is '<'
      let f4+=1
      if f4==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '<' && m>0
            let f4+=1
          elseif s is '>'
            let f4-=1
            if f4==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '"' || c is "'"
      if n==0
        let k=0
        for item in qlist
          if epos==item
            if k%2
              return printf("v%dho",epos-qlist[k-1])
            else
              return printf("v%dl",qlist[k+1]-epos)
            endif
          endif
          let k+=1
        endfor
      else
        let k=0
        for item in qlist
          if bpos-n==item
            if k%2
              let n+=item-qlist[k-1]
            else
              return printf(mf."%dlo%dho",qlist[k+1]-epos,bpos-item)
            endif
            break
          endif
          let k+=1
        endfor
      endif
    endif
    let n+=1
  endwhile
  return ''
endfunction
"abrev
iabbr nnp nnoremap
iabbr vp vnoremap
iabbr np noremap
iabbr cd col(".")<C-R>=Delspace('\s')<CR>
iabbr cv col("v")<C-R>=Delspace('\s')<CR>
iabbr gl getline()<Left><C-R>=Delspace('\s')<CR>
iabbr ep <expr><C-R>=Delspace('\s')<CR>
iabbr re return
