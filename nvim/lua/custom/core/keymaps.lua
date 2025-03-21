local keymap = vim.keymap

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
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" }) -- Save and quit
keymap.set("n", "<leader>q", "<cmd>quit<cr>", { silent = false, desc = "quit current window without saving" }) -- Save only if modified; quit
keymap.set("n", "<leader>x", "<cmd>x<cr>", { silent = true, desc = "quit current window" }) -- Save only if modified; quit
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim without saving" }) -- Quit ALL open

-- Move current line up and down
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "move line up" })

keymap.set("i", "<A-j>", "<cmd>m .+1<CR>", { desc = "move line down" })
keymap.set("i", "<A-k>", "<cmd>m .-2<CR>", { desc = "move line up" })

-- Clear search highlight
keymap.set("n", "<leader>l", '<cmd>let @/ = ""<CR>', { silent = true, desc = "clear search highlighting" })

-- Copy & Paste from clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y')
keymap.set({ "n", "v" }, "<leader>p", '"+p')

-- Move current visual-line selection up and down
-- keymap.set("x", "<A-j>", "<cmd>m '<-2<CR>gv=gv", { desc = "move selection down" })
-- keymap.set("x", "<A-k>", "<cmd>m '>+1<CR>gv=gv", { desc = "move selection up" })
