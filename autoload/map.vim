let mapleader = ","

nmap <space>w <C-W>

" terminal
tnoremap <S-Esc> <C-\><C-n>
tnoremap <S-space> <C-\><C-n>
nnoremap <silent> <leader>tt :tab term<CR>

" write and/or quit
noremap <silent> <leader>W :wa<CR>
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>X :wqa<CR>
noremap <silent> <leader>x :wq<CR>
noremap <silent> <leader>Q :qa!<CR>
noremap <silent> <leader>q :q<CR>
noremap <silent> <leader>dd :bd<CR>

" language
nnoremap <silent> <leader>ar :set arabic!<CR>
nnoremap <silent> <leader>sp :set spell!<CR>
