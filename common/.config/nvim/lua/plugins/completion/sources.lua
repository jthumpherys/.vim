local M = {}

local snippet = {
  entry = {
    "quangnguyen30192/cmp-nvim-ultisnips",
    dependencies = { "ultisnips", "treesitter" },
  },
  source = { name = "ultisnips" },
  display = "Ulti",
}

local fuzzy_buffer = {
  entry = {
    "tzachar/cmp-fuzzy-buffer",
    dependencies = { "tzachar/fuzzy.nvim", dependencies = "telescope-fzf" },
  },
  source = { name = "fuzzy_buffer" },
  display = "Buffer",
}

local buffer_lines = {
  entry = "amarakon/nvim-cmp-buffer-lines",
  source = { name = "buffer-lines" },
  display = "Buf Lines"
}

local fuzzy_path = {
  entry = {
    "tzachar/cmp-fuzzy-path",
    dependencies = { "tzachar/fuzzy.nvim", dependencies = "telescope-fzf" },
  },
  source = {
    name = "fuzzy_path",
    option = {
      fd_cmd = {
        'fd', '--max-depth', '20', '--full-path', -- default
        '--type', 'd', '--type', 'f', -- suggest directories
        '--follow', -- follow symbolic links for suggestions
        -- '--no-ignore-vcs', -- suggest files in .gitignore
        -- '--hidden',
        -- '--glob',
        '--exclude', "'*.pyc'",
        '--exclude', "'__*__'",
      },
    },
  },
  display = "Path",
}

local ripgrep = {
  entry = "lukas-reineke/cmp-rg",
  source = { name = "rg" },
  display = "RipGrep",
}

local spell = {
  entry = {
    "f3fora/cmp-spell",
    config = function()
      vim.opt.spell = true
      vim.opt.spelllang = { 'en_us' }
    end,
  },
  source = { name = "spell" },
  display = "Spell",
}

local lsp = {
  entry = "hrsh7th/cmp-nvim-lsp",
  source = { name = "nvim_lsp" },
  display = "LSP",
}

local source_data = {
  all = {
    { snippet, lsp },
    { fuzzy_buffer, ripgrep, fuzzy_path },
    { spell },
  },

  filetypes = {
    c = {
      filetype = { "c", "cpp" },
      use_all = true,
      sources = { { buffer_lines } },
    },

    gitcommit = {
      filetype = "gitcommit",
      use_all = true,
      sources = {
        {
          { entry = "petertriho/cmp-git", source = { name = "git" }, display = "git" },
          { entry = "Dosx001/cmp-commit", source = { name = "commit" }, display = "commit" },
        },
      },
    },

    latex = {
      filetype = { "tex", "plaintex" },
      use_all = true,
      sources = {
        {
          { entry = "hrsh7th/cmp-omni", source = { name = "omni" }, display = "vimtex" },
          {
            entry = "amarakon/nvim-cmp-lua-latex-symbols",
            source = { name = "latex-symbols" },
            display = "Latex",
          },
        },
      },
    },

    lua = {
      filetype = "lua",
      use_all = true,
      sources = {
        {
          { entry = "hrsh7th/cmp-nvim-lua", source = { name = "nvim_lua" }, display = "Lua" },
          {
            entry = { "KadoBOT/cmp-plugins",
              opts = {
                files = { vim.fn.stdpath("data") .. "/lazy/" },
              },
            },
            source = { name = "plugins" },
            display = "Plugins",
          },
        },
      },
    },

    markdown = {
      filetype = "markdown",
      use_all = true,
      sources = {
        {
          {
            entry = "jmbuhr/otter.nvim",
            source = { name = "otter.nvim" },
            display = "Otter",
          },
        },
      },
    },

    text = {
      filetype = "text",
      use_all = false,
      sources = { { fuzzy_buffer, spell } },
    },

    toml = {
      filetype = "toml",
      use_all = true,
      sources = {
        {
          {
            entry = "crates",
            source = { name = "crates" },
            display = "Crates",
          },
        },
      },
    },

    zsh = {
      filetype = "zsh",
      use_all = true,
      sources = {
        {
          {
            entry = "tamago324/cmp-zsh",
            source = { name = "zsh" },
            display = "Zsh",
          },
        },
      },
    }
  },

  cmdlines = {
    [':'] = {
      { fuzzy_path },
      {
        {
          entry = "hrsh7th/cmp-cmdline",
          source = { name = "cmdline" },
          display = "CmdLine",
        },
        {
          entry = "dmitmel/cmp-cmdline-history",
          source = { name = "cmp-cmdline-history" },
          display = "CmdHist",
        },
      },
      { fuzzy_buffer, ripgrep },
    },
    ['/'] = {
      { fuzzy_buffer, ripgrep },
    },
  },
}

M.sources = {}
M.plugins = {}
M.menu = {}
for index, source_list in pairs(source_data.all) do
  for _, source in pairs(source_list) do
    table.insert(M.plugins, source.entry)

    local src = vim.deepcopy(source.source)
    src.group_index = index
    table.insert(M.sources, src)

    M.menu[source.source.name] = source.display
  end
end
M.filetypes = {}
for _, data in pairs(source_data.filetypes) do
  local srcs = {}
  for index, source_list in pairs(data.sources) do
    for _, source in pairs(source_list) do
      table.insert(M.plugins, source.entry)

      local src = vim.deepcopy(source.source)
      src.group_index = index
      table.insert(srcs, src)

      M.menu[source.source.name] = source.display
    end
  end
  if data.use_all ~= false then
    for index, source_list in pairs(source_data.all) do
      for _, source in pairs(source_list) do
        source.source.group_index = index
        table.insert(srcs, source.source)
      end
    end
  end
  table.insert(M.filetypes, { sources=srcs, filetype=data.filetype })
end
M.cmdlines = {}
for type, srcs in pairs(source_data.cmdlines) do
  M.cmdlines[type] = {}
  for index, source_list in pairs(srcs) do
    for _, source in pairs(source_list) do
      table.insert(M.plugins, source.entry)

      local src = vim.deepcopy(source.source)
      src.group_index = index
      table.insert(M.cmdlines[type], src)

      M.menu[source.source.name] = source.display
    end
  end
end

return M
