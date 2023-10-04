let g:loaded_python3_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

"set t_Co=265
set mouse=a

set showcmd
set wildmenu
set wildmode=longest:full:lastused
" set wildignore *.docx*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,

set scrolloff=10
set backspace=indent,eol,start

set encoding=UTF-8
set nobackup
set noswapfile

set nofoldenable
set foldmethod=manual

set shiftwidth=4
set tabstop=4
set smartindent
set expandtab

set nohlsearch
set showmatch
set incsearch
set ignorecase
set smartcase

set statusline="" 
set statusline+=%F\ %M\ %Y\ %R%=\ (%l,%c)\ %p%%
set laststatus=2

set number
set relativenumber
syntax enable

set cursorline

set nowrap

set spelllang=ar,en

colorscheme tender

runtime autoload/map.vim
runtime autoload/netrw_config.vim

let g:asyncomplete_auto_popup = 0
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <c-space> <Plug>(asyncomplete_force_refresh)
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

let g:lsp_use_lua = 0
let g:lsp_log_verbose = 0
let g:lsp_auto_enable = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled  = 0
let g:lsp_diagnostics_float_insert_mode_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0

let g:lsp_document_highlight_enabled = 0
let g:lsp_inlay_hints_enabled = 0
let g:lsp_signature_help_enabled = 0

let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#focuspreview')]

let g:lsp_ignorecase = 1

if executable('ccls')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'allowlist': ['c', 'cpp'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <space>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

