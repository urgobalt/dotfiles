return {
    "yutkat/confirm-quit.nvim",
    config = function()
        local cq = require("confirm-quit")
        cq.setup({ overwrite_q_command = true })
        vim.keymap.set("n", "<leader>q", cq.confirm_quit)
        vim.keymap.set("n", "<leader>Q", cq.confirm_quit_all)
        vim.keymap.set("n", "<C-q>", function() cq.confirm_quit({ bang=true }) end)
    end
}
