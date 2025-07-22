return {
    {
    "SmiteshP/nvim-navic",
    opts = {
      depth_limit = 0,
      highlight = true,
    },
  },
 {
    "LunarVim/breadcrumbs.nvim",
    opts = function()
      require("breadcrumbs").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {},
    },
    config = require("config.lualine").config,
  }
}
