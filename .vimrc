set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ahayman/vim-nodejs-complete'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser
Plugin 'editorconfig/editorconfig-vim'
call vundle#end()

filetype on
filetype plugin indent on    " required
filetype plugin on

set guifont=Menlo\ Regular\ for\ Powerline:h12
nmap <F8> :TagbarToggle<CR>
map <C-f> :NERDTreeToggle<CR>

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>	   :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-S-t> :tabnew<CR>
inoremap <C-S-t> <Esc>:tabnew<CR>
inoremap <C-S-w> <Esc>:tabclose<CR>

set tabpagemax=15
set showtabline=2

let g:nodejs_complete_config = {
			\  'js_compl_fn': 'jscomplete#CompleteJS',
			\  'max_node_compl_len': 15
			\}

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"

endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
    \}

let g:tagbar_type_css = {
			\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
    \ }

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
    \ }

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
	    \}

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }


 let g:tagbar_type_rust = {
     \ 'ctagstype' : 'rust',
     \ 'kinds' : [
         \'T:types,type definitions',
         \'f:functions,function definitions',
         \'g:enum,enumeration names',
         \'s:structure names',
         \'m:modules,module names',
         \'c:consts,static constants',
         \'t:traits,traits',
         \'i:impls,trait implementations',
     \]
     \}


 let g:tagbar_type_scala = {
     \ 'ctagstype' : 'scala',
     \ 'kinds'     : [
       \ 'p:packages:1',
       \ 'V:values',
       \ 'v:variables',
       \ 'T:types',
       \ 't:traits',
       \ 'o:objects',
       \ 'a:aclasses',
       \ 'c:classes',
       \ 'r:cclasses',
       \ 'm:methods'
     \ ],
     \ 'sro'        : '.',
     \ 'kind2scope' : {
         \ 'T' : 'type',
         \ 't' : 'trait',
         \ 'o' : 'object',
         \ 'a' : 'abstract class',
         \ 'c' : 'class',
         \ 'r' : 'case class'
     \ },
     \ 'scope2kind' : {
       \ 'type' : 'T',
       \ 'trait' : 't',
       \ 'object' : 'o',
       \ 'abstract class' : 'a',
       \ 'class' : 'c',
       \ 'case class' : 'r'
     \ }
     \ }

 let g:tagbar_type_xslt = {
   \ 'ctagstype' : 'xslt',
   \ 'kinds' : [
     \ 'v:variables',
     \ 't:templates'
   \ ]
   \}


