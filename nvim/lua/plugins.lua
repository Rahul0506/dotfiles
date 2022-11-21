-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/nord.nvim'
    use 'marko-cerovac/material.nvim'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[ require('plugin-configs.lualine') ]]
    }

    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        tag = 'nightly',
        config = [[ require('plugin-configs.nvim-tree') ]]
    }

    -- File Search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = [[ require('plugin-configs.telescope') ]]
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use "ThePrimeagen/harpoon"  -- Quick File jump

    -- Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = [[ require('plugin-configs.treesitter') ]],
    }
    use 'p00f/nvim-ts-rainbow'

    -- Auto complete stuff
    use { "onsails/lspkind-nvim", event = "VimEnter" }

    -- A completion plugin for neovim coded in Lua.
    use {
        "hrsh7th/nvim-cmp",
        after = "lspkind-nvim",
        config = [[ require('plugin-configs.cmp') ]]
    }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" } -- nvim-cmp source for neovim builtin LSP client
    use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" } -- nvim-cmp source for nvim lua
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" } -- nvim-cmp source for buffer words.
    use { "hrsh7th/cmp-path", after = "nvim-cmp" } -- nvim-cmp source for filesystem paths.

    -- Common LSP configs
    use {
        "neovim/nvim-lspconfig",
        config = [[ require('plugin-configs.lspconfig') ]]
    }
end)
