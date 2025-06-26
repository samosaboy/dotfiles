vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require("resession").save("current", { notify = false })
  end,
})
