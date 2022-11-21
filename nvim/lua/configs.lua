local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
local fn = vim.fn            -- call Vim functions
local g = vim.g -- global variables

cmd("autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey") -- to Show whitespace, MUST be inserted BEFORE the colorscheme command
g.material_style = "deep ocean"
cmd("colorscheme material")
set.termguicolors = true


-- Whitespace stuff
set.list = false
set.listchars = {
    nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    tab = "▷─", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
    trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
    space = " "
}
set.fillchars = {
    diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
    fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    -- vert = " " -- remove ugly vertical lines on window division
}

set.splitbelow = true -- open horizontal splits below current window
set.splitright = true -- open vertical splits to the right of the current window

-- set.clipboard = set.clipboard + unnamedplus -- use clipboard for copy etc.

set.wrap = false -- don't automatically wrap on load
set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.relativenumber = true -- show relative line number
set.numberwidth = 5
set.ignorecase = true -- ignore case sensitive while searching
set.smartcase = true -- smart case: case sensitive when upper-cased
set.scrolloff = 10 -- when scrolling, keep cursor 1 lines away from screen border
set.sidescrolloff = 20 -- keep 20 columns visible left and right of the cursor at all times
set.incsearch = true -- incremental search
set.hlsearch = true -- highlighted search results

-- Tab/Space behaviour
set.expandtab = true
set.softtabstop = 4
set.shiftwidth = 4 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
set.tabstop = 4 -- spaces per tab
set.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
set.autoindent = true -- maintain indent of current line
set.shiftround = true -- rounds the next tabbing to shiftwidth

-- Ignore certain files and folders when globing
set.wildignore = set.wildignore + "*.o,*.obj,*.dylib,*.bin,*.dll,*.exe"
set.wildignore = set.wildignore + "*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**"
set.wildignore = set.wildignore + "*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico"
set.wildignore = set.wildignore + "*.pyc,*.pkl"
set.wildignore = set.wildignore + "*.DS_Store"
set.wildignore = set.wildignore + "*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv"
set.wildignorecase = true -- ignore file and dir name cases in cmd-completion

-- Mouse interaction
-- set.mouse = a  -- Enable mouse in several mode
-- set.mousemodel = popup  -- Set the behaviour of mouse
-- set.mousescroll = "ver:1,hor:6"

-- completion options
set.completeopt = "menuone,noselect,noinsert"

cmd([[au BufWritePre * :%s/\s\+$//e]])

exec(
  [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200, on_visual=true}
  augroup end
]],
  false
)

