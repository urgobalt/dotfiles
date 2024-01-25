return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndotree" })
        end
    },
    "tpope/vim-surround",
    "tpope/vim-repeat", -- Repeat actions better
    -- "godlygeek/tabular", -- Quickly align text by pattern
    -- "tpope/vim-sleuth",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {'numToStr/Comment.nvim', config = function()
        require("Comment").setup()
    end},
    {"echasnovski/mini.bufremove", config = function()
        require("mini.bufremove").setup()
    end}
}
