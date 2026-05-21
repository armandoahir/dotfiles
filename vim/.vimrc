" ============================================================
"  GENERALE
" ============================================================
set nocompatible
set encoding=utf-8
set history=1000
set undolevels=1000
set hidden                " permette di cambiare buffer senza salvare

" ============================================================
"  INTERFACCIA
" ============================================================
set number
set relativenumber
set cursorline
set showmatch
set ruler
set laststatus=2
set wildmenu
set wildmode=list:longest,full
set scrolloff=8
set signcolumn=yes        " colonna per i segni LSP (errori, warning)
set updatetime=300        " aggiorna più velocemente (utile per LSP)

" ============================================================
"  RICERCA
" ============================================================
set hlsearch
set incsearch
set ignorecase
set smartcase

" ============================================================
"  INDENTAZIONE
" ============================================================
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" ============================================================
"  COLORI
" ============================================================
syntax on
set background=dark
set termguicolors         " colori 24-bit nel terminale (se supportato)

" ============================================================
"  PLUGIN (vim-plug)
" ============================================================
" Installazione vim-plug (esegui una volta):
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

  " --- Editing ---
  Plug 'tpope/vim-surround'           " cs, ds, ys per gestire parentesi/virgolette
  Plug 'tpope/vim-commentary'         " gcc per commentare
  Plug 'tpope/vim-repeat'             " . funziona con surround e commentary
  Plug 'tpope/vim-vinegar'            " - per aprire netrw migliorato

  " --- Navigazione ---
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'             " :Files, :Buffers, :Rg

  " --- Tema ---
  Plug 'morhetz/gruvbox'

  " --- Status bar ---
  Plug 'itchyny/lightline.vim'

  " --- LSP + autocompletamento ---
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/vim-lsp-settings'       " :LspInstallServer installa tutto automaticamente

call plug#end()

" ============================================================
"  TEMA
" ============================================================
colorscheme gruvbox

" ============================================================
"  LIGHTLINE
" ============================================================
set noshowmode            " lightline già mostra la modalità
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left':  [['mode','paste'], ['readonly','filename','modified']],
  \   'right': [['lineinfo'], ['filetype']]
  \ }}

" ============================================================
"  LSP
" ============================================================
" Attiva completamento con Tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" Diagnostica: mostra errori nella command line
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0   " metti 1 se vuoi il testo inline

" ============================================================
"  KEYMAPPING
" ============================================================
let mapleader = " "

" Salva / chiudi
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Togli highlight ricerca
nnoremap <Esc> :nohlsearch<CR>

" Navigazione split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>h :History<CR>

" LSP
nnoremap gd :LspDefinition<CR>
nnoremap gr :LspReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap <leader>r :LspRename<CR>
nnoremap <leader>e :LspDocumentDiagnostics<CR>
nnoremap [d :LspPreviousDiagnostic<CR>
nnoremap ]d :LspNextDiagnostic<CR>

" Navigazione buffer
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

" Apri terminale integrato in split orizzontale
nnoremap <leader>t :terminal<CR>

