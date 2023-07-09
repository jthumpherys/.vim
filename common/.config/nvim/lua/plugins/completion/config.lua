local M = {}

function M.cmp_config_function()
  local cmp = require("cmp")

  cmp.setup(
    {
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#anon"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert(
        {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }
      ),
      sources = cmp.config.sources(
        {
          { name = "treesitter" },
          { name = "ultisnips" },

          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "omni" },

          { name = "buffer-lines" },
        },
        {
          { name = "buffer" },
        }
      )
    }
  )

  cmp.setup.filetype(
    "gitcommit",
    {
      sources = cmp.config.sources(
        {
          { name = "git" },
        },
        {
          { name = "buffer" },
        }
      )
    }
  )

  cmp.setup.cmdline(
    { '/', '?' },
    {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    }
  )

  cmp.setup.cmdline(
    ':',
    {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {
          { name = "path" },
        },
        {
          { name = "cmdline" },
        }
      )
    }
  )
end
  -- opts.sources = cmp.config.sources(opts.sources)

  -- local snips_mappings = require("cmp_nvim_ultisnips.mappings")
  -- local cmp_map = {
  --   ['<tab>'] = cmp.mapping(
  --     function(fallback)
  --       snips_mappings.expand_or_jump_forwards(fallback)
  --     end,
  --     { 'i', 's' }
  --   ),

  --   ['<s-tab>'] = cmp.mapping(
  --     function(fallback)
  --       snips_mappings.jump_backwards(fallback)
  --     end,
  --     { 'i', 's' }
  --   ),

    -- ['<tab>'] = {
    --   func = { "mapping" },
    --   args = {
    --     function(fallback) snips_mappings.expand_or_jump_forwards(fallback) end,
    --     { 'i', 's' },
    --   },
    -- },

    -- ['<s-tab>'] = {
    --   func = { "mapping" },
    --   args = {
    --     function(fallback) snips_mappings.jump_backwards(fallback) end,
    --     { 'i', 's' },
    --   },
    -- },

  --   ['<c-space>'] = {
  --     func = "complete",
  --     args = {},
  --   },

  --   ['<CR>'] = {
  --     func = "confirm",
  --     args = { select = true },
  --   },

  --   ['<c-a>'] = {
  --     func = "abort",
  --     args = {},
  --   },

  --   ['<c-h>'] = {
  --     func = "scroll_docs",
  --     args = -4,
  --   },

  --   ['<c-l>'] = {
  --     func = "scroll_docs",
  --     args = 4,
  --   },
  -- }

  -- local mapping = {}
  -- for key, data in pairs(cmp_map) do
  --   mapping[key] = cmp.mapping[data.func](data.args)
  -- end
--   opts.mapping = cmp.config.sources(cmp_map)  -- cmp.mapping.preset.insert(mapping)

--   for _, comparator in pairs(opts.sorting.comparators) do
--     local comp = nil
--     if comparator.pkg == "cmp" then
--       comp = cmp
--     else
--       comp = require(comparator.pkg)
--     end

--     for _, p in pairs(comparator.subpkg) do
--       comp = comp[p]
--     end

--     opts.sorting.comparators[_] = comp
--   end

--   cmp.setup(opts)


--   cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())


--   for _, filetype in pairs(opts.filetypes) do
--     cmp.setup.filetype(
--       filetype.type,
--       {
--         sources = cmp.config.sources(filetype.sources),
--       }
--     )
--   end

--   for _, group in pairs(opts.cmdlines) do
--     cmp.setup.cmdline(
--       group.type,
--       {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = cmp.config.sources(group.sources),
--       }
--     )
--   end
-- end

-- function M.pairs_config_function(_, opts)
--   local pairs = require("nvim-autopairs")
--   pairs.setup(opts)

--   -- local Rule = require("nvim-autopairs.rule")
--   -- local cond = require("nvim-autopairs.conds")
--   -- pairs.add_rules(
--   --   {
--   --     Rule(),
--   --   }
--   -- )
-- end

-- function M.close_config_function(_, opts)
--   require("autoclose").setup(opts)
-- end

return M
