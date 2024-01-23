local augroup = vim.api.nvim_create_augroup

local AabruptGroup = augroup('AabruptGroup', {})
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.api.nvim_create_user_command("Reload", R, { nargs = "?" })

vim.api.nvim_create_autocmd('TextyankPost', {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearcch',
            timeout = 40,
        })
    end
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = AabruptGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
