---@type LazyPluginSpec
return {
  "Civitasv/cmake-tools.nvim",
  ft = { "c", "cpp", "cmake" },
  opts = {
    cmake_executor = {
      name = "overseer",
    },
  },
}
