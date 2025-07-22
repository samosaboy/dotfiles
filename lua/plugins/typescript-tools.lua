return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git")(fname)
    end,
  },
}
