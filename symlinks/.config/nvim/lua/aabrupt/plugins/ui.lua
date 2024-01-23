local function color_my_pencils(color)
    color = color or "github_dark_dimmed"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none", })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", })
end

return {
    {
        "projekt0n/github-nvim-theme",
        priority = 1000,
        config = function()
            require("github-theme").setup({ options = { transparent = true, dim_inactive = true } })
            color_my_pencils()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options =
                {
                    icons_enabled = true,
                    theme = "github_dark_dimmed",
                    component_separators = "|",
                    section_separators = ""
                }
            })
        end
    },
}
