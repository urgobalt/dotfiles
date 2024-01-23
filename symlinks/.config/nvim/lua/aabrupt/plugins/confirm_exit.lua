return {
    "yutkat/confirm-quit.nvim",
    event = "CmdlineEnter",
    config = function()
        require("confirm-quit").setup({})
    end
}
