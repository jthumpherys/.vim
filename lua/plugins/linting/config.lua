local M = {}

M.filetypes = {
  lua = { package = "stylua", method = "formatting" },
  python = {
    package = "pylint", method = "diagnostics",
    config = { extra_args = {"--max-line-length=90"} },
  },
  vim = { package = "vint", method = "diagnostics" },
}

M.packages = {}
for _, source in pairs(M.filetypes) do
  table.insert(M.packages, source.package)
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

return M
