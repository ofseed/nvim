local manager = require "session_manager"
local Path = require "plenary.path"

manager.setup {
  sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
  path_replacer = "__", -- The character to which the path separator will be replaced for session files.
  colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
}

vim.api.nvim_set_keymap("n", "<leader>ss", "SaveSession", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sl", "LoadLastSession", { noremap = true, silent = true })
