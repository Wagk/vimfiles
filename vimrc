" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Pathogen plugin
call pathogen#infect()
call pathogen#helptags()
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Use space instead of tabs,
"set expandtab
set tabstop=4
set shiftwidth=4

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, ilocksct does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Set backtick to serve as the escape key to prevent RSI
" :imap ` <Esc>

" Let me paste things repeatedly
xnoremap p pgvy
xnoremap P Pgvy

" Default theme
if has("gui_running")
    set background=dark
    colorscheme solarized
end

" Font and Fontsize
set guifont=Consolas:h11

" Windows splitting
set splitbelow
set splitright

" Folding settings
set foldmethod=syntax
set foldopen-=block
set nofoldenable
let c_no_comment_fold = 1

" Realtime updates
set autoread

" Window launch size configuration
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Timestamp Keybindings
nmap <F5> i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR>

" No wordwrap
set wrap!
set textwidth=0

" vimwiki things
let wiki = {}
let wiki.path = '~/Vimwiki/'
let wiki.auto_toc = 1
let wiki.auto_tags = 1
let wiki.syntax = 'markdown'

let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [wiki]

" turn on delimitMate
let delimitMate_expand_cr = 1

" always update working directory of vim files
set autochdir

" Scratch things
let g:scratch_top = 0

" airline things
let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%Y-%m-%dT%H:%M:%S")}'])
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" NERDTree things
" let loaded_nerd_tree=1
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Statusline
set statusline=%{fugitive#statusline()}
nnoremap <silent> <leader><Space> :Gstatus<CR>

"Journal things
"let g:journal_encrypted = 1

" pymode things
"let g:pymode_python = 'python3'
let g:pymode_python = 'disable'
let g:pymode_options_colorcolumn = 0
let g:pymode_quickfix_minheight = 5
let g:pymode_quickfix_maxheight = 10
let g:pymode_doc = 0
let g:pymode_rope = 0

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Easyalign mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" windowswap bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" session
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Calender
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" encryption things
set cm=blowfish2

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E221'

" autoformatter things
let g:formatter_yapf_style = 'google'

" AsyncRun
nnoremap <leader>a :AsyncRun<Space>
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

" better whitespace settings
autocmd BufEnter * EnableStripWhitespaceOnSave

" Easymotion things
map <Space><Space> <Plug>(easymotion-prefix)
map <Space><Space><Space> <Plug>(easymotion-jumptoanywhere)
