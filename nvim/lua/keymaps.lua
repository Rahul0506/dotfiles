local keymap = vim.keymap
local api = vim.api
local tele = require('telescope.builtin')

vim.g.mapleader = " "

keymap.set({ "n", "x" }, ";", ":") -- Map semi-colon to colon, avoid shift-ing

-------------------------------------------------------------------------------

-- Nvim Bindings

-------------------------------------------------------------------------------

-- Move the cursor based on physical lines, not the actual lines.
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "^", "g^")
keymap.set("n", "0", "g0")

-- Go to start or end of line easier
keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")

 -- Faster exits, autosave
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })  -- Save and quit
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })  -- Save only if modified; quit
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })  -- Quit ALL open

-- Move current line up and down
keymap.set("n", "<A-j>", '<cmd>m .+1<CR>==', { desc = "move line down" })
keymap.set("n", "<A-k>", '<cmd>m .-2<CR>==', { desc = "move line up" })

keymap.set("i", "<A-j>", '<cmd>m .+1<CR>', { desc = "move line down" })
keymap.set("i", "<A-k>", '<cmd>m .-2<CR>', { desc = "move line up" })

-- Move current visual-line selection up and down
-- keymap.set("x", "<A-j>", "<cmd>m '<-2<CR>gv=gv", { desc = "move selection down" })
-- keymap.set("x", "<A-k>", "<cmd>m '>+1<CR>gv=gv", { desc = "move selection up" })

-------------------------------------------------------------------------------

-- Plugin Bindings

-------------------------------------------------------------------------------

-- Telescope
keymap.set('n', '<leader>ff', tele.find_files, {})
keymap.set('n', '<leader>fg', tele.live_grep, {})
keymap.set('n', '<leader>fb', tele.buffers, {})
keymap.set('n', '<leader>fh', tele.help_tags, {})

-- Nvim-tree
keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>")
keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<cr>")
keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<cr>")

-- Harpoon
keymap.set('n', '<leader>jj', require('harpoon.ui').toggle_quick_menu, { silent = true })
keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { silent = true })
