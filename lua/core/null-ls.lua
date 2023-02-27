local ok, ls = pcall(require, "null-ls")
if not ok then
  vim.notify "Could not load null-ls"
  return
end

local os, mason = pcall(require, "mason-null-ls")

mason.setup {
  automatic_setup = true,
}

mason.setup_handlers {
  function(source_name, methods)
    -- all sources with no handler get passed here

    -- To keep the original functionality of `automatic_setup = true`,
    -- please add the below.
    require "mason-null-ls.automatic_setup"(source_name, methods)
  end,
}

ls.setup {
  border = "rounded",
  fallback_severity = vim.diagnostic.severity.INFO,
}
