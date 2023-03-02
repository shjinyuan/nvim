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
set number
set relativenumber
set cursorline
set hid
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
" set nolist
set list
set listchars=tab:\|\ ,trail:▫

"禁止产生临时文件
set noundofile
set nobackup
set noswapfile

set scrolloff=4
set timeoutlen=500
set viewoptions=cursor,folds,slash,unix
set nowrap
set tw=0
set indentexpr=cident
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
nnoremap <LEADER>stt :%s/  /\t/g
" vnoremap <LEADER>tt :s/  /\t/g

" Tab to space
nnoremap <LEADER>tts :%s/\t/  /g
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

" code navigation
Plug 'jsfaint/gen_tags.vim'
Plug 'joereynolds/gtags-scope'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

call plug#end()
"}}}

"gtags 设置项
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1



" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1
noremap <silent> <leader>ss :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>sg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>sc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>st :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>se :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>sf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>si :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>sd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>sa :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>sz :GscopeFind z <C-R><C-W><cr>
