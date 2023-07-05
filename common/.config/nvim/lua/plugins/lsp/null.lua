local M = {}

M.packages = {
  lua = {
    stylua = { method = "formatting" },
    -- selene = { method = "diagnostics" },
  },
  python = {
    ruff = { method = "formatting" },
    mypy = { method = "diagnostics" },
  },
  zsh = { zsh = { method = "diagnostics", mason = false }},
}

M.package_installation_list = {}
for _, pkgs in pairs(M.packages) do
  for name, pkg in pairs(pkgs) do
    if pkg.mason == nil or pkg.mason then
      table.insert(M.package_installation_list, name)
    end
  end
end

M.filetypes = {}
for lang, _ in pairs(M.packages) do
  table.insert(M.filetypes, lang)
end

local null_opts = { sources = {} }
function M.get_plugin_options()
  local null = require("null-ls")
  for _, pkgs in pairs(M.packages) do
    for name, pkg in pairs(pkgs) do
      table.insert(null_opts.sources, null.builtins[pkg.method][name])
    end
  end
  return null_opts
end

return M
