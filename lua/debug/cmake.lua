local ok, cmake = pcall(require, "cmake")
if not ok then
  vim.notify "Could not load cmake"
  return
end

local ok, key = pcall(require, "which-key")
if not ok then
  vim.notify "Could not load which-key"
  return
end

local path = require "plenary.path"

local script_path = path:new(debug.getinfo(1).source:sub(2))

cmake.setup {
  cmake_executable = "cmake", -- CMake executable to run.
  parameters_file = "neovim.json", -- JSON file to store information about selected target, run arguments and build type.
  build_dir = tostring(path:new("{cwd}", "build", "{os}-{build_type}")), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values.
  samples_path = tostring(script_path:parent():parent():parent() / "samples"), -- Folder with samples. `samples` folder from the plugin directory is used by default.
  default_projects_path = tostring(path:new(vim.loop.os_homedir(), "Projects")), -- Default folder for creating project.
  configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
  build_args = {}, -- Default arguments that will be always passed at cmake build step.
  on_build_output = nil, -- Callback which will be called on every line that is printed during build process. Accepts printed line as argument.
  quickfix_height = 10, -- Height of the opened quickfix.
  quickfix_only_on_error = false, -- Open quickfix window only if target build failed.
  dap_configuration = {
    type = "codelldb",
    request = "launch",
  }, -- DAP configuration. By default configured to work with `lldb-vscode`.
  dap_open_command = require("dap").repl.open, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
}

local function on_attach()
  vim.keymap.set("n", "<leader><leader>c", "<cmd>CMake configure<CR>", { buffer = true, desc = "CMake configure" })
  vim.keymap.set("n", "<leader><leader>q", "<cmd>CMake cancel<CR>", { buffer = true, desc = "CMake cancel" })
  vim.keymap.set("n", "<leader><leader>r", "<cmd>CMake run<CR>", { buffer = true, desc = "CMake run" })
  vim.keymap.set("n", "<leader><leader>d", "<cmd>CMake debug<CR>", { buffer = true, desc = "CMake debug" })

  vim.keymap.set("n", "<leader><leader>bb", "<cmd>CMake build<CR>", { buffer = true, desc = "Build target" })
  vim.keymap.set("n", "<leader><leader>ba", "<cmd>CMake build_all<CR>", { buffer = true, desc = "Build all" })
  vim.keymap.set("n", "<leader><leader>br", "<cmd>CMake build_and_run<CR>", { buffer = 0, desc = "Build and run" })
  vim.keymap.set("n", "<leader><leader>bd", "<cmd>CMake build_and_debug<CR>", { buffer = 0, desc = "Build and debug" })

  vim.keymap.set("n", "<leader><leader>st", "<cmd>CMake select_target<CR>", { buffer = 0, desc = "Target" })
  vim.keymap.set("n", "<leader><leader>sb", "<cmd>CMake select_build_type<CR>", { buffer = 0, desc = "Build type" })

  key.register({
    ["<leader><leader>b"] = { name = "+build" },
    ["<leader><leader>s"] = { name = "+select" },
  }, { buffer = 0 })
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.c", "*.cpp", "*.h", "CMakeLists.txt" },
  callback = on_attach,
})
