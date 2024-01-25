return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable "make" == 1
            end
        },
        "jonarrien/telescope-cmdline.nvim",
    },
    config = function()
        require('telescope').setup {
            extensions = {
                cmdline = {
                    picker   = {
                        layout_config = {
                            width  = 120,
                            height = 25,
                        }
                    },
                    mappings = {
                        complete      = '<Tab>',
                        run_selection = '<C-CR>',
                        run_input     = '<CR>',
                    },
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    }
                }
            }
        }

        pcall(require('telescope').load_extension, 'fzf')
        require("telescope").load_extension("cmdline")

        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = 'Find recent files' })
        vim.keymap.set("n", "<leader><space>", builtin.buffers,
            { desc = 'Find existing buffers' })
        vim.keymap.set("n", "<leader>/", function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set("n", "<leader>mc", ':silent Telescope cmdline<CR>', {noremap = true, desc = "Telescope CmdLine"})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {desc="Find git files"})
    end

}
