local M = {}


function M.config_function(_, opts)
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

  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end


function M.pairs_config_function(_, opts)
  local npairs = require("nvim-autopairs")
  npairs.setup(opts)

  local Rule = require("nvim-autopairs.rule")
  local cond = require("nvim-autopairs.conds")

  -- Add spaces on both sides inside braces while still allowing escaping
  local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
  npairs.add_rule(
    Rule(' ', ' ', { "-markdown", "-text" })
      :with_pair(
        function (pair_opts)
          local pair = pair_opts.line:sub(pair_opts.col - 1, pair_opts.col)
          return vim.tbl_contains(
            {
              brackets[1][1]..brackets[1][2],
              brackets[2][1]..brackets[2][2],
              brackets[3][1]..brackets[3][2],
            },
            pair
          )
        end
      )
  )
  for _, bracket in pairs(brackets) do
    npairs.add_rule(
      Rule(bracket[1]..' ', ' '..bracket[2], { "-markdown", "-text" })
        :with_pair(cond.none())
        :with_move(
          function(pair_opts)
            return pair_opts.prev_char:match('.%'..bracket[2]) ~= nil
          end
        )
        :use_key(bracket[2])
    )
  end

  -- Add comma after closing bracket in lua unless within parentheses
  npairs.add_rule(
    Rule('{', '},', "lua")
      :with_pair(require("nvim-autopairs.ts-conds").is_ts_node({"table_constructor"}))
      -- :with_pair(npairs.is_not_ts_node({""}))
      -- :replace_endpair(function() return "}," end, function() cond.before_regex("{^}*") end)
  )
end

return M
