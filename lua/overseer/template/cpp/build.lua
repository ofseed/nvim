return {
  name = "C/C++ Build",
  desc = "Builds a single file",
  builder = function()
    local filename = vim.fn.expand "%:t"
    local filename_base = vim.fn.expand "%:t:r"
    local filedir = vim.fn.expand "%:p:h"
    local filetype = vim.bo.filetype
    local compiler = "c++"

    if filetype == "c" then
      compiler = "cc"
    end

    return {
      cmd = { compiler },
      args = {
        filename,
        "-o",
        filename_base,
        "-g"
      },
      cwd = filedir,
      name = "Build " .. filename,
      components = {
        { "on_output_quickfix", open_on_match = true },
        "unique",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "c", "cpp" },
  },
}
