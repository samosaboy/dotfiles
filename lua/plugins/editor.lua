return {
  {
    "pantharshit00/vim-prisma",
  },
  {
    "ibhagwan/fzf-lua",
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        {
          fzf_opts = { ["--wrap"] = true },
          previewers = {
            builtin = {
              syntax_limit_b = -102400, -- 100KB limit on highlighting files
            },
          },
          grep = {
            rg_glob = true,
            -- first returned string is the new search query
            -- second returned string are (optional) additional rg flags
            -- @return string, string?
            rg_glob_fn = function(query, opts)
              local regex, flags = query:match("^(.-)%s%-%-(.*)$")
              -- If no separator is detected will return the original query
              return (regex or query), flags
            end,
          },
          winopts = {
            preview = {
              wrap = "wrap",
            },
          },
          defaults = {
            git_icons = true,
            file_icons = true,
            color_icons = true,
            formatter = "path.filename_first",
          },
        },
      })
    end,
    opts = {
      oldfiles = {
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
      grep = {
        -- One thing I missed from Telescope was the ability to live_grep and the
        -- run a filter on the filenames.
        -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
        -- With this change, I can sort of get the same behaviour in live_grep.
        -- ex: > enable --*/plugins/*
        -- I still find this a bit cumbersome. There's probably a better way of doing this.
        rg_glob = true, -- enable glob parsing
        glob_flag = "--iglob", -- case insensitive globs
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      },
    },
  },
}
