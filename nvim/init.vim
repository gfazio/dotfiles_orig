" ================================
"             NVimrc 
" ================================
"
" Plugin setup --- via vim-plug ----- {{{
"
filetype off
"
" set the runtime path to include Vundle and initialize
"
"set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
"
call plug#begin('~/.config/nvim/plugged')
Plug 'alfredodeza/pytest.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux'
Plug 'cburroughs/pep8.py'
Plug 'chriskempson/tomorrow-theme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/ag'
Plug 'ervandew/screen'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jnurmine/Zenburn'
Plug 'julienr/vim-cellmode'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'klen/python-mode'
Plug 'KabbAmine/zeavim.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'nelstrom/vim-markdown-preview'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'rkulla/pydiction'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'sjl/tslime2.vim'
Plug 'suan/vim-instant-markdown'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/timl'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/pydoc.vim'
Plug 'vim-scripts/vim-R-plugin'
Plug 'vimwiki/vimwiki'
Plug 'wincent/command-t'
Plug 'WolfgangMehner/vim-plugins'
"
" All Plugins must be added before the following line
"
call plug#end()            " required
"
"
filetype on
"
" }}}
"
" =================================
"
" GUI Settings ---------------------- {{{
"
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
	    set lines=40
            colorscheme zenburn

	    if has("gui_gtk2")
               set guifont=Inconsolata\ 15
	    elseif has("gui_macvim")
                set guifont=Inconsolata-dz:h14
	    endif

            set guicursor=n-v-c:block-Cursor
    else
            set background=dark
	    set t_Co=256
            colorscheme wombat256i 

    endif

"
" }}}
"
" =================================
"
" General Settings ------ {{{
"

let mapleader=","
let maplocalleader=" "

set autowrite
set columns=100
set dictionary+=/usr/share/dict/words
set foldlevel=0   "0=all folds closed; 99=all folds open
set foldmethod=marker
set hidden
set lines=40
set nobackup
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4
set showmatch
set showmode
set title
"set t_RV=       "surpress terminal version query from vim
set visualbell
set wildmode=list,longest,full
"
" }}}
"
" =================================
"
" General Key Bindings ----- {{{
"

noremap <C-F11> :NERDTreeToggle <CR>
nnoremap <leader>n :NERDTreeToggle <CR>

noremap <C-M> :make %<CR>
noremap <C-F5> :setlocal spell! spelllang = en_gb<CR>

noremap <C-\> :tab split <CR>exec("tag ".expand("<cword>"))<CR>
noremap <A-]> :vsp       <CR>exec("tag ".expand("<cword>"))<CR>

nnoremap <leader>a :Ag<CR>

noremap <C-F3> <ESC>:set guifont=*<CR>
nnoremap <leader>f :set guifont=Monospace\ 12<CR>
nnoremap <leader>F :set guifont=Monospace\ 15<CR>
nnoremap <leader>[ :tabprevious<CR> 
nnoremap <leader>] :tabnext<CR> 

" clears highlighted search results
nnoremap <Esc> :nohlsearch <CR><Esc>

"cd to current working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" edit vimrc file
nnoremap <leader>v :edit $MYVIMRC<CR>
"
"If you forget to sudo before calling vim use the following to be
"able to write the file.
cnoremap w!! %!sudo tee > /dev/null %

"open with @locate or find command
"tutorial video: https://www.youtube.com/watch?v=X0KP15O006M
noremap <leader>o :exec '!xdg-open ' . shellescape(getline('.')) <CR><CR>
noremap <leader>mp :exec '!mplayer ' . shellescape(getline('.')) <CR><CR>
noremap <leader>yp :exec '!mplayer $(youtube-dl -g ' . shellescape(getline('.')) . ')' <CR><CR>

"See docstrings for folded code
let g:SimpylFold_docstring_preview=1

"Toggle relative numbering, and set to absolute on loss of focus or insert
"mode

set rnu
function! ToggleNumbersOn()
    set nonumber!
    set norelativenumber!
endfunction
function! ToggleAbsoluteOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusGained * call ToggleRelativeOn()
autocmd FocusLost * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
nmap <Leader>l :call ToggleNumbersOn()<CR>

""" SYSTEM CLIPBOARD COPY AND PASTE SUPPORT """
set pastetoggle=<F2>      "F2 before pasting to preserve indentation
"copy/paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<Esc>"*]p:set nopaste<CR>"
map <silent><Leader><S-p> :set paste<CR>O<Esc>"*]p:set nopaste<CR>"

"
" =================================
"
" Ranger File Browser in Vim  ----- {{{
" http://www.everythingcli.org/use-ranger-as-a-file-explorer-in-vim/
function! g:RangerExplorer()
   exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " .
   expand("%:p:h")
   if filereadable('/tmp/vim_ranger_current_file')
      exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
      call system('rm /tmp/vim_ranger_current_file')
   endif
   redraw!
endfunction
noremap <Leader>re :call g:RangerExplorer()<CR>
" }}}
"
"
" =================================

"
"Manage multiple windows
"nnoremap <leader>W :call g:VGGToggleWindowFixedWidth()<CR>
"nnoremap <leader>H :call g:VGGToggleWindowFixedHeight()<CR>
nnoremap <leader>W :call g:VGGAutoWindowResize()<CR>
" }}}
"
" =================================
"
" Eclim Settings ------ {{{
"
" =================================
"

" Status line setting
let g:EclimProjectStatusLine = 'eclim(p=${name}, n=${natures})'

let g:EclimProjectTreeAutoOpen=1
let g:EclimLocateFileNonProjectScope = 'ag'

"
" }}}
"
" =================================
"
" Status Line ----- {{{
"
function! Local_AirlineThemePatcher(palette)
        " Trick to ensure 'Normal' highlight group exists
	  if !hlexists('Normal')
	      highlight Normal ctermbg=0
	  endif
endfunction
	
let g:airline_theme='luna'

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

set timeoutlen=300 ttimeoutlen=0
set laststatus=2     "Always display status line
set statusline=%F    "Full path to the file
set statusline+=\ -\        "Separator 
set statusline+=%-4{fugitive#statusline()}  "If using git, show 
                                            "branch being used 
					    "in status line.
set statusline+=%-4{eclim#project#util#ProjectStatusLine()} " If using
                                                            " eclim, show project 
							    " status line
set statusline+=%=    "Switch to the right side
set statusline+=%l    "Current line
set statusline+=/    " Separator
set statusline+=%L    "Total lines

"
" }}}
"
" =================================
"
" Vimscript file settings ------------ {{{
"
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker 
	" Source the vimrc file after saving it 
	if has("autocmd") 
		autocmd! bufwritepost $MYVIMRC nested :source $MYVIMRC 
	endif
	function! g:VGGToggleWindowFixedWidth()
		:set winfixwidth!
		if &l:winfixwidth
			echo "Fixed Window Width ON"
		else
			echo "Fixed Window Width OFF"
		endif
	endfunction
	function! g:VGGToggleWindowFixedHeight()
		:set winfixheight!
		if &l:winfixheight
			echo "Fixed Window Height ON"
		else
			echo "Fixed Window Height OFF"
		endif
	endfunction
	function! g:VGGAutoWindowResize()
		if winwidth == 100 || winheight == 40
			set nowinfixwidth nowinfixheight
			set noequalalways eadirection=both
			set winminwidth=1 winminheight=1
			set winwidth=9999 winheight=999
			set helpheight=999 cmdwinheight=999 previewheight=999
			echo "Window Defaults ON"
		else
			set nowinfixwidth nowinfixheight
			set equalalways eadirection=both
			set winminwidth=1 winminheight=0
			set winwidth=100 winheight=40
			set helpheight=20 cmdwinheight=7 previewheight=12
			echo "Window Defaults OFF"
		endif
	endfunction
augroup END
"
" }}}
"
" =================================
"
" Javascript file settings ------------ {{{
"
augroup filetype_js
	autocmd!
	autocmd FileType javascript setlocal foldmethod=marker omnifunc=javascriptcomplete#CompleteJS
augroup END
"
" }}}
"
" =================================
"
" Omnicompletion and SuperTab settings ------- {{{
"
inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown>  pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>  pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:SuperTabDefaultCompletionType="context"

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
" Automatically open and close the popup menu / preview window
"

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"
" }}}
"
" =================================
"
" Taglist Settings ---- {{{
"
" Taglist variables
"
set tags+=./tags;/    
set tags+=/home/vgg/Computing/Sandbox/tags    
"
"can verify taglist is correct via 
": set verbose tags?" command

"
" Display function name in status bar:
"
let g:ctags_statusline=1
"
" Automatically start script
"
let generate_tags=1
"
" Displays taglist results in a vertical window:
"
let Tlist_Use_Horiz_Window=0
"
" Shorter commands to toggle Taglist display
"
nnoremap TT :TlistToggle<CR>
nnoremap <C-S-F11> :TlistToggle<CR>
noremap <C-S-F12> :call g:VGGCTagsGenerate()<CR>

function! g:VGGCTagsGenerate()
		:!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q . 
		:!ctags -R --c-kinds=+pl --fields=+iaS --extra=+q . 
		:!ctags -R --Fortran-kinds=+iL --fields=+iaS --extra=+q . 
		:!ctags -R --Python-kinds=+cfimv --fields=+iaS --extra=+q . 
		:!ctags -R --Vim-kinds=+acfmv --fields=+iaS --extra=+q . 
	         echo "cTags generated..."
endfunction
"
" Various Taglist diplay config:
"
let Tlist_Use_Left_Window=1
let Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_WinWidth=20

"
" }}}
"
" =================================
"
"Tagbar Settings ---- {{{
"
"Toggle Tagbar window 
let g:tagbar_width=20
let g:tagbar_zoomwidth=0
nnoremap <F7> :TagbarToggle<CR>
"
" }}}
"
" =================================
"
"Some Python settings:------------------- {{{

augroup filetype_py
	" Clears the group each time vimrc is sourced 
	" to prevent multiple definitions of the same autocmd
	"
	autocmd!
	" 
	autocmd FileType python set omnifunc=pythoncomplete#Complete 
	autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 
	autocmd BufRead, BufNewFile *.py
		    \ set tabstop=4
		    \ set softtabstop=4
		    \ set shiftwidth=4
		    \ set textwidth=79
	            \ set expandtab
	            \ set autoindent 
	            \ set fileformat=unix

	" 
	" This will allow you to check the syntax of your entire file 
	" by typing :make. You can the get a list of errors with :clist 
	" and move between the errors with :cn and :cp.  
	" 
	autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
	autocmd Bufwrite *.(py) : call Pyflakes() 
	autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

	" Execute pydoc on the current word in the file being edited
"	autocmd FileType python noremap <buffer> K : execute "!xterm -e 'pydoc " . expand("<cword>") . "'"<CR> 
	" Execute file being edited with <Command> + e: 
"	noremap <buffer> <C-e> :w\|!/usr/bin/env python % <CR>

let g:pydiction_location="~/.vim/bundle/pydiction/complete-dict" 
let g:pyflakes_use_quickfix=0 
let g:pep8_map="<leader>8"
"
" For full syntax highlighting:
"
let python_highlight_all=1
syntax on

"
"pymode
"
let g:pymode_python = 'python3'
"
" jedi-vim settings
"

let g:jedi#goto_command = "<LocalLeader>d"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_assignments_command = "<LocalLeader>G"
let g:jedi#goto_definitions_command = "<LocalLeader>GG"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<LocalLeader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<LocalLeader>r"
let g:jedi#show_call_signatures  = 2
"
"
" screen stuff
"
let g:ScreenImpl = "Tmux"
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellSendPrefix = ''
let g:ScreenShellSendSufix = ''


" Open an IPython3 shell.
autocmd FileType python map <LocalLeader>p :IPython!<CR>

" Close whichever shell is running.
autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>

" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>v :ScreenSend<CR>0j

" Send a <CR> to ipython.
autocmd FileType python map <LocalLeader>cr :call g:ScreenShellSend("\r")<CR>

" Clear the screen.
autocmd FileType python map <LocalLeader>L  :call g:ScreenShellSend('!clear')<CR>
"
" Using tslime2 to send python code to ipython
" press vip to select current paragraph then press <C-c><C-c> and this sends
" the code to ipthon. This also works sending current line and any selected text
"
" cellmode 
"
let g:cellmode_use_tmux=1
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber=2
"
" Vimux
"

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

"If text is selected  save it in the v buffer and send that buffer to tmux
"vmap <LocalLeader>k \"vy :call VimuxSlime()<CR>

"Select current paragraph and send that it to tmux
"nmap <LocalLeader>x vip<LocalLeader>vs<CR>
" Execute py tests
"
nnoremap <silent><leader>ptf <Esc>:Pytest file<CR>
nnoremap <silent><leader>ptc <Esc>:Pytest class<CR>
nnoremap <silent><leader>ptm <Esc>:Pytest method<CR>
"
" Cycle through test errors
"
nnoremap <silent><leader>ptn <Esc>:Pytest next<CR>
nnoremap <silent><leader>ptp <Esc>:Pytest previous<CR>
nnoremap <silent><leader>pte <Esc>:Pytest error<CR>

augroup END

"
" }}}
"
" =================================
"
" Latex Settings ----- {{{ 
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.

set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files 
" defaults to 'plaintex' instead of 'tex', which results in vim-latex 
" not being loaded. The following changes the default filetype back 
" to 'tex':

let g:tex_flavor='latex'
"
" }}}
"
" =================================
"
" Man Pages Settings ----- {{{ 
"
"  Set up the reading of manpages from within vim (use :Man whatever)

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"
" }}}
"
" =================================
"
" Ag Settings ----- {{{ 
"
" ag.vim is a plugin for vim which allows you to search over files using the
" silver searcher (ag).
"
" Usage
"
" :Ag [options] pattern [directory]
"
" The :Ag command provides several features to make running ag easier:
"
"    :Ag supports command completion of:
"
"         - patterns from search history: hit <tab> when starting
"	          to run :Ag and you can choose from a list of 10 of your most
"                 recent searches. A common use case while editing code could be to
"	          hit * on a function name to search for occurrences in the current
"	          file, then to run :Ag <tab> to search for the function across all
"	          files.
"	  - ag options: If you type - and then hit <tab>, you can
"	          scroll through all the ag.vim supported ag options.
"	  - file/directory name to search in: Once you've
"	          supplied a search pattern, the next argument to
"	          :Ag is an optional directory or file to search in
"	          and you can make use of <tab> completion to choose
"	          that file or directory.
"       ag.vim also registers itself as a backend for eclim's :LocateFile functionality. You
"	can even set ag as the default for non-eclim projects by adding the following to your vimrc:
"
"	let g:EclimLocateFileNonProjectScope = 'ag'

	let g:AgSmartCase=1 
"
" }}}
" =================================
"
" Vim Wiki Settings ----- {{{ 
"
" vimwiki - Personal wiki for vim
" https://github.com/vikiwiki/vimwik

" vimwiki with markdown support

let g:vimwiki_list = [{'path': '$HOME/vimwiki',
                     \ 'syntax': 'markdown',
                     \ 'ext': '.md'}]

" help-page -> :h vimwiki-syntax

"vim-instant-markdown - Instant markdown previews from vim
" https://github.com/suan/vim-instant-markdown

let g:instant_markdown_autostart = 0      " disable autostart
noremap <LocalLeader>md :InstantMarkdownPreview<CR>

"
" }}}
"
" =================================
"
" FZF Settings ----- {{{ 
"
function! FzfOmniOmniFiles()
    let is_git = system('git status')
    if v:shell_error
	:Files
    else
	:GitFiles
    endif
endfunction
nnoremap <C-P> : call FzfOmniOmniFiles()<CR>

let g:fzf_files_options =
 \ '--preview "(coderay {} || cat {}) 2> /dev/null | head - '.&lines.'"'

"
" }}}
"
" =================================
"
" UltiSnips Settings ----- {{{ 
"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<LocalLeader>s"
let g:UltiSnipsJumpForwardTrigger="<C-S-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"
" }}}
"
" =================================
"
" CtrlP Settings ----- {{{ 
"
let g:ctrlp_map = '<c-p>'
"
" }}}
"
" =================================
"
" =================================
"
runtime ftplugin/man.vim
"
" =================================
