local config = function()

local manager = require "session_manager"

local overseer = require "overseer"

local Path = require "plenary.path"

-- Convert the cwd to a simple file name
local function get_cwd_as_name()
  local dir = vim.fn.getcwd(0)
  return dir:gsub("[^A-Za-z0-9]", "_")
end

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

vim.api.nvim_create_autocmd("User", {
  pattern = "SessionSavePre",
  callback = function()
    local task_name = get_cwd_as_name()

    -- Remove the task if it exists
    if vim.tbl_contains(overseer.list_task_bundles(), task_name) then
      overseer.delete_task_bundle(task_name)
    end

    overseer.save_task_bundle(
      task_name,
      -- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
      -- pass in the results if you want to save specific tasks.
      nil,
      { on_conflict = "overwrite" } -- Overwrite existing bundle, if any
    )
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "SessionLoadPost",
  callback = function()
    overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
  end,
})

end

return {
  "Shatur/neovim-session-manager",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = config,
  keys = {
    { "<leader>ss", "<cmd>SessionManager load_session<CR>", desc = "Load selected" },
    { "<leader>sl", "<cmd>SessionManager load_last_session<CR>", desc = "Load last" },
    { "<leader>sd", "<cmd>SessionManager delete_session<CR>", desc = "Delete" },
    { "<leader>scs", "<cmd>SessionManager save_current_session<CR>", desc = "Save" },
    { "<leader>scl", "<cmd>SessionManager load_current_dir_session<CR>", desc = "Load" },
  }
}
