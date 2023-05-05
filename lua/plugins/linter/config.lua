local M = {}

M.filetypes = {
  -- lua = { package = "stylua", method = "formatting" },
  -- python = {
  --   package = "pylint", method = "diagnostics",
  --   config = { extra_args = {"--max-line-length=90"} },
  -- },
  -- vim = { package = "vint", method = "diagnostics" },
}

local packages = {}
for _, source in pairs(M.filetypes) do
  table.insert(packages, source.package)
end

function M.get_options()
  local sources = {}
  local null = require("null-ls")
  for _, source in pairs(M.filetypes) do
    table.insert(sources, null.builtins[source.method][source.package].with(source.config or {}))
  end
  return {
    sources = sources
  }
end

function M.setup()
  local mason = require("mason-registry")
  for _,server in pairs(packages) do
    if not mason.is_installed(server) then
      vim.cmd { cmd = "MasonInstall", args = { server } }
    end
  end
end
return M
