local sources = require("plugins.completion.sources")

return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    opts = function()
      local cmp = require("cmp")
      local ultisnips = require("cmp_nvim_ultisnips.mappings")

      return {
        preselect = cmp.PreselectMode["None"],
        snippet = { expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<tab>'] = cmp.mapping(
            function(fallback) ultisnips.compose({"select_next_item", "jump_forwards"})(fallback) end,
            { 'i', 's' }
          ),
          ['<S-tab>'] = cmp.mapping(
            function(fallback) ultisnips.compose({"select_prev_item", "jump_backwards"})(fallback) end,
            { 'i', 's' }
          ),
        },
        sorting = {
          comparators = {
            require("cmp_fuzzy_path").compare,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        sources = sources.sources,
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            menu = sources.menu,
            maxwidth = 50,
            ellipsis_char = '……',
          })
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      cmp.setup(opts)

      for _, srcs in pairs(sources.filetypes) do
        cmp.setup.filetype(srcs.filetype, { sources = srcs.sources })
      end

      for type, srcs in pairs(sources.cmdlines) do
        if type == '/' then
          type = { '/', '?' }
        end
        cmp.setup.cmdline(type, { mapping = cmp.mapping.preset.cmdline(), sources = srcs })
      end
    end,
    init = function()
      require("plugins.lsp.language_servers").default_opts.capabilities = require("cmp_nvim_lsp").default_capabilities()
    end,
    dependencies = {
      { "tzachar/fuzzy.nvim" },
      { "lukas-reineke/cmp-under-comparator" },
      { "onsails/lspkind.nvim" },

      sources.plugins,
    },
    event = { "CmdlineEnter", "InsertEnter" },
  },

  {
    "SirVer/ultisnips",
    name = "ultisnips",
    init = function()
      vim.g.python3_host_prog = "/usr/bin/python3"
    end,
    dependencies = { "honza/vim-snippets" },
  },

}
