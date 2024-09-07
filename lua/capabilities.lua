-- Default LSP server settigns
local M = vim.lsp.protocol.make_client_capabilities()

-- Additional capabilities supported by nvim-cmp
M.textDocument.completion = {
  dynamicRegistration = false,
  completionItem = {
    snippetSupport = true,
    commitCharactersSupport = true,
    deprecatedSupport = true,
    preselectSupport = true,
    tagSupport = {
      valueSet = {
        1, -- Deprecated
      },
    },
    insertReplaceSupport = true,
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
        "sortText",
        "filterText",
        "insertText",
        "textEdit",
        "insertTextFormat",
        "insertTextMode",
      },
    },
    insertTextModeSupport = {
      valueSet = {
        1, -- asIs
        2, -- adjustIndentation
      },
    },
    labelDetailsSupport = true,
  },
  contextSupport = true,
  insertTextMode = 1,
  completionList = {
    itemDefaults = {
      "commitCharacters",
      "editRange",
      "insertTextFormat",
      "insertTextMode",
      "data",
    },
  },
}

-- Additional capabilities supported by nvim-ufo
M.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
