set nocompatible

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader = ',' 			    "The default leader
set number				    "Activate linenumber
set showmode				    "Always show what mode we're currently editing in
set complete=.,w,b,u 			    "Set desired autocompletion
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

"-------- Searching --------"
set hlsearch
set incsearch

"-------- Visuals --------"
set t_CO=256
colorscheme atom-dark-256
"Linenumber colors
highlight LineNr ctermfg=grey ctermbg=black 

"-------- Mappings --------"
"Edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Edit snippets
nmap <Leader>es :e ~/.vim/snippets<cr>
"Edit plugins
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
"Add simple hightlight removal
nmap <Leader><space> :nohlsearch<cr>

"-------- Split management --------"
nmap <C-J> <C-W><C-J>			"down
nmap <C-K> <C-W><C-K>			"up
nmap <C-H> <C-W><C-H>			"left
nmap <C-L> <C-W><C-L>			"right
set splitbelow
set splitright

"-------- Browsers ------"
nmap <C-n> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0
"Search  methods, apt-get install ctags
nmap <C-R> :CtrlPBufTag<cr>		
"Most recently used files
nmap <C-e> :CtrlPMRUF<cr>		
nmap <Leader>f :tag<space>

"GReplace.vim / zoeken en vervangen
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"--- Laravel specific commands ---
nmap <Leader><Leader>r :e routes/web.php<cr>
nmap <Leader><Leader>a :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>

"-- pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>

"-------- Auto-Commands -------
"Automatic source the .vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost ~/.vimrc source %
augroup END

"vim-php-namespace
"function! IPhpInsertUse()
"    call PhpInsertUse()
"    call feedkeys('a',  'n')
"endfunction
"autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
"autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"function! IPhpExpandClass()
"    call PhpExpandClass()
"    call feedkeys('a', 'n')
"endfunction
"autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
"autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"Sort PHP use statements
vmap <leader>eo ! awk -f "{ print length(), $0 \| \"sort -n \| cut -d\\  -f2-\"}"<cr>

