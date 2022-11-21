require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "lua",
        "python",
    },

    ignore_install = {}, -- List of parsers to ignore installing

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { 'help' }, -- list of language that will be disabled
    },
    rainbow = {
        enable = false,
        -- extended-mode = true, -- For other pair stuff like tags
        -- max_file_lines = nil, -- Disable for files larger than n lines
    }
}
