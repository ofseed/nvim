---@type LazyPluginSpec
return {
  "ThePrimeagen/refactoring.nvim",
  -- Plugin surpporting refactorings
  -- Disable because it needs neovim nightly
  enabled = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {},
  keys = {
    -- Remaps for the refactoring operations currently offered by the plugin
    { "v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]] },
    { "v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]] },
    { "v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]] },
    { "v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]] },

    -- Extract block doesn't need visual mode
    { "n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]] },
    { "n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]] },

    -- Inline variable can also pick up the identifier currently under the cursor without visual mode
    { "n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]] },
  },
}
