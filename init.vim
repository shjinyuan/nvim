" __  ____   __  _   ___	 _____ __  __ ____   ____
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

" Basic setting {{{
" ===
" === Editor behavior
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set cursorcolumn
set hidden
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set nolist
" set list
" set listchars=tab:\|\ ,trail:▫
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
set ignorecase
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
" set colorcolumn
" hi ColorColumn ctermbg=blue
set updatetime=100
set virtualedit=block
set autoread
set autowriteall
set mouse=a
" set termguicolors
" if &term =~# '^screen'
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
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

nn cc :cclose<CR>
"{{{ === Basic Mappings
" ===
" ===
" Set <LEADER>
let mapleader=","



" Save & quit
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap <C-S> :w<CR>

" Open the vimrc file anytime
noremap <space>rc :e $HOME/.config/nvim/init.vim<CR>
noremap <space>bc :e $HOME/.bashrc<CR>

" Open README.md
noremap <leader>he :vs $HOME/.config/nvim/README.md<CR>
noremap <leader>hd :vs $HOME/.config/nvim/Man<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>stt :%s/	/\t/g
" vnoremap <LEADER>tt :s/	/\t/g

" Tab to space
nnoremap <LEADER>tts :%s/\t/	/g
" Folding
" noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>



" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5kzz
noremap <silent> E 5jzz

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b


" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>


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
"  M -> ALT
" cnoremap <M-b> <S-Left>
" cnoremap <M-w> <S-Right>

" ===
" === Searching
" ===
" noremap - N
" noremap = n

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>ww <C-w>w
" noremap <LEADER>wk <C-w>k
" noremap <LEADER>wj <C-w>j
" noremap <LEADER>wh <C-w>h
" noremap <LEADER>wl <C-w>l
noremap qf <C-w>o
nmap <space>wh :vertical res +30<CR>
nmap <space>wl :vertical res -30<CR>
nmap <space>wj :res +15<CR>
nmap <space>wk :res -15<CR>


" Disable the default s key
" noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>



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
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

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

" Call figlet
noremap tx :r !figlet

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

" ===
" === Install Plugins with Vim-Plug
" ===

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
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

" Autoformat
Plug 'Chiel92/vim-autoformat'
call plug#end()


"================================================================================
" Plugin setting START
"================================================================================
"
" Autoformat setting
let g:formatdef_allman = '"astyle --style=allman -k3 -A3 -t -F -z2"'
let g:formatters_cpp = ['allman']
let g:formatters_c = ['allman']

"
" Airline setting to show tabs ontop
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1



""
"" === vim-lsp with ccls setting
""
let g:lsp_auto_enable = 1
" if executable('ccls')
	" au User lsp_setup call lsp#register_server({
				" \ 'name': 'ccls',
				" \ 'cmd': {server_info->['ccls']},
				" \ 'root_uri': {server_info->lsp#utils#path_to_uri(
				" \				lsp#utils#find_nearest_parent_file_directory(
				" \								lsp#utils#get_buffer_path(),
				" \		['.ccls', 'compile_commands.json', '.git/']
				" \	))},
				" \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
				" \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				" \ })
" endif
" Key bindings for vim-lsp.
nn <silent> <M-d> :vert LspDefinition<cr>
nn <silent> <M-r> :vert LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>

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
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

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

" Set C to use its alternate delimiters by default: //
let g:NERDAltDelims_c= 1

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
inoremap <expr> <cr>	pumvisible() ? asyncomplete#close_popup() : "\<cr>"


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
" nmap <silent> <Leader>te <Plug>TranslateW<CR>
" vmap <silent> <Leader>te <Plug>TranslateWV<CR>
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR<CR>
" vmap <silent> <Leader>r <Plug>TranslateRV<CR>
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX<CR>


"
" === rainbow_parentheses.vim setting
"
let g:rbpt_colorpairs = [
			\ ['brown',	   'RoyalBlue3'],
			\ ['Darkblue',	'SeaGreen3'],
			\ ['darkgray',	'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',	'RoyalBlue3'],
			\ ['darkred',	 'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',	   'firebrick3'],
			\ ['gray',		'RoyalBlue3'],
			\ ['black',	   'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',	'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',	'SeaGreen3'],
			\ ['darkred',	 'DarkOrchid3'],
			\ ['red',		 'firebrick3'],
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
" let g:gitgutter_show_msg_on_hunk_jumping = 0
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
" function! GitStatus()
	" let [a,m,r] = GitGutterGetHunkSummary()
	" return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline+=%{GitStatus()}
" function! NextHunkAllBuffers()
	" let line = line('.')
	" GitGutterNextHunk
	" if line('.') != line
		" return
	" endif
"
	" let bufnr = bufnr('')
	" while 1
		" bnext
		" if bufnr('') == bufnr
			" return
		" endif
		" if !empty(GitGutterGetHunks())
			" 1
			" GitGutterNextHunk
			" return
		" endif
	" endwhile
" endfunction
"
" function! PrevHunkAllBuffers()
	" let line = line('.')
	" GitGutterPrevHunk
	" if line('.') != line
		" return
	" endif
"
	" let bufnr = bufnr('')
	" while 1
		" bprevious
		" if bufnr('') == bufnr
			" return
		" endif
		" if !empty(GitGutterGetHunks())
			" normal! G
			" GitGutterPrevHunk
			" return
		" endif
	" endwhile
" endfunction
"
" nmap <silent> ]c :call NextHunkAllBuffers()<CR>
" nmap <silent> [c :call PrevHunkAllBuffers()<CR>
"
"
" === vim-which-key setting
"
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>	  :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"
"==== Markdonw setting
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {},
			\ 'flowchart_diagrams': {}
			\ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


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
nnoremap ,= :call bufferhint#Popup()<CR>

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
autocmd! bufwritepost $HOME/.config/nvim/init.vim
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

if &diff
	syntax off
endif
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

"
"===================================
" Cool tricks
"===================================
" insert time
ab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>



let g:ascii = [
			\ '		   __',
			\ '.--.--.|__|.--------.',
			\ '|  |  ||  ||		   |',
			\ ' \___/ |__||__|__|__|',
			\ ''
			\]
" let g:startify_custom_header =
" \ startify#pad(g:ascii + startify#fortune#boxed())
let g:startify_custom_header =
			\ 'startify#pad(g:ascii)'



"{{{
" custom highlight setting
"
"
" ======== Gitgutter sign
highlight GitGutterAdd		guifg=Green
highlight GitGutterDelete guifg=Gray
highlight GitGutterChange guifg=Blue
"
"
"========== Diff Mode
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Green
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=black guibg=Blue
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=black guibg=Yellow
" for v mode selection
highlight Visual	 cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=black guibg=white
"
"
"========== Menu for selection
hi Pmenu ctermfg=10 ctermbg=17 guibg=Black guifg=Green
hi PmenuSel ctermfg=10 ctermbg=17 guibg=Gray guifg=White
"}}}

let g:fzf_colors =
			\ { 'fg':	 ['fg', 'Normal'],
			\ 'bg':	     ['bg', 'Normal'],
			\ 'hl':	     ['fg', 'Comment'],
			\ 'fg+':	 ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':	 ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':	 ['fg', 'Statement'],
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

" set cscopetag " 使用 cscope 作为 tags 命令
" set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"
"
"gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

hi CursorLine gui=underline cterm=underline guifg=revert guibg=black
hi CursorColumn gui=bold guibg=darkmagenta
match WhitespaceEOL /\s\+$/
highlight WhitespaceEOL ctermbg=red guibg=red

vnoremap <expr><CR> ConTract()
function! ConTract()
	if (col(".")-col("v")>0)
		return "holo"
	endif
	return "loh"
endfunction

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
" iabbr nnp nnoremap
" iabbr vp vnoremap
" iabbr np noremap
" iabbr cd col(".")<C-R>=Delspace('\s')<CR>
" iabbr cv col("v")<C-R>=Delspace('\s')<CR>
" iabbr gl getline()<Left><C-R>=Delspace('\s')<CR>
" iabbr ep <expr><C-R>=Delspace('\s')<CR>
" iabbr re return
"
"
" replace for git merget
" :%s/<<<<<<< HEAD\_.\{-}=======\n//
" :%s/>>>>>>>.*\n//

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
"cursor style configure
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

