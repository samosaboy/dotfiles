return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_session_enabled = true,
      log_level = vim.log.levels.ERROR,
      auto_save_enabled = true,
      auto_session_create_enabled = true,
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })

    vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
}
