local M = {}


function M.cmp_config_function(_, opts)
  local cmp = require("cmp")
  local sources = require("plugins.completion.sources")
  local ultisnips = require("cmp_nvim_ultisnips.mappings")

  if opts.preselect ~= nil then
    opts.preselect = cmp.PreselectMode[opts.preselect]
  end

  for key, mapping in pairs(opts.mapping) do
    if mapping.loc == "local" then
      opts.mapping[key] = cmp.mapping[mapping.fn](mapping.args or nil)
    elseif mapping.loc == "ultisnips" then
      if mapping.args ~= nil then
        opts.mapping[key] = cmp.mapping(
          function(fallback) ultisnips[mapping.fn](mapping.args)(fallback) end, {'i', 's'}
        )
      else
        opts.mapping[key] = cmp.mapping(
          function(fallback) ultisnips[mapping.fn](fallback) end, {'i', 's'}
        )
      end
    end
  end

  for _, comparator in pairs(opts.sorting.comparators) do
    if comparator.loc == "local" then
      opts.sorting.comparators[_] = cmp.config.compare[comparator.fn]
    else
      opts.sorting.comparators[_] = require(comparator.loc)[comparator.fn]
    end
  end

  cmp.setup(opts)

  for filetype, srcs in pairs(sources.filetypes) do
    cmp.setup.filetype(filetype, { sources = srcs })
  end

  for type, srcs in pairs(sources.cmdlines) do
    if type == '/' then
      type = { '/', '?' }
    end
    cmp.setup.cmdline(type, { mapping = cmp.mapping.preset.cmdline(), sources = srcs })
  end
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

function M.pairs_config_function(_, opts)
  local cmp = require("cmp")
  local pairs = require("nvim-autopairs")
  pairs.setup(opts)

  -- local Rule = require("nvim-autopairs.rule")
  -- local cond = require("nvim-autopairs.conds")
  -- pairs.add_rules(
  --   {
  --     Rule(),
  --   }
  -- )
  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M
