return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vimdoc", "javascript", "typescript", "rust", "lua", "c", "ocaml" },

            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<c-z>',
                }
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")

        vim.filetype.add({
            extension = {
                mdx = "mdx"
            }
        })
        treesitter_parser_config.mdx = {
            install_info = {
                url = "https://github.com/jlopezcur/tree-sitter-mdx.git",
                files = {"src/parser.c"},
                branch = "master",
            }
        }
        vim.treesitter.language.register("mdx", "mdx")
    end

}
