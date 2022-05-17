local ok, manager = pcall(require, "session_manager")
if not ok then
  vim.notify "Could not load session manager"
  return
end

local Path = require "plenary.path"

manager.setup {
  sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
  path_replacer = "__", -- The character to which the path separator will be replaced for session files.
  colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    "gitcommit",
  },
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
}

vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", { silent = true })
vim.keymap.set("n", "<leader>sl", ":SessionManager load_last_session<CR>", { silent = true })
