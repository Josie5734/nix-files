--General Options

vim.cmd("let g:netrw_liststyle = 3") --Explore uses a tree style

local opt = vim.opt --shorten commands so dont have to type "vim" every time

--line stuff
opt.relativenumber = true --relative line numbers
opt.number = true --absolute line number for cursor
opt.cursorline = true --highlight line that cursor is on
opt.scrolloff = 10 --keep the cursor X lines from the top/bottom of the page
opt.sidescrolloff = 10 --keep the cursor X lines from the side of the page

--tabs and indentation
opt.tabstop = 2 --tabs are 2 spaces
opt.shiftwidth = 2 --2 spaces for indent width
opt.expandtab = true --tabs are spaces
opt.autoindent = true --autoindent new line
opt.wrap = false --disable line wrapping

--search settings
opt.ignorecase = true --search is case insensitive by default
opt.smartcase = true --search is case sensitive if an uppercase is used

--visuals
opt.termguicolors = true --use true color
opt.background = "dark" --use dark background by default
opt.signcolumn = "yes" --show sign column (for symbols on the left side)

--backspace
opt.backspace = "indent,eol,start" --allow backspace on indent, end of line or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default register

--split windows
opt.splitright = true --split vertical window to right
opt.splitbelow = true --split horizontal window to bottom

--swapfile + undo
opt.swapfile = false
opt.undofile = true
