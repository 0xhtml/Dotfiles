set expandtab
set hidden
set ignorecase
set number
set shiftwidth=4
set smartcase
set softtabstop=4
set wildmenu

syntax on

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

command LatexPreview let g:livepreview_previewer = 'mupdf' |
  \ packadd vim-latex-live-preview | :LLPStartPreview
command Rainbow let g:rainbow_active = 0 | packadd rainbow | :RainbowToggleOn
