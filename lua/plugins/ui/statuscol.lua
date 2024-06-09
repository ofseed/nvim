---@type LazyPluginSpec
return {
  "luukvbaal/statuscol.nvim",
  branch = "0.10",

  opts = function()
    local builtin = require "statuscol.builtin"

    return {
      bt_ignore = { "nofile", "terminal" },
      ft_ignore = { "NeogitStatus" },
      segments = {
        -- Simulate the sign column while not showing the gitsigns
        {
          sign = {
            name = { ".*" },
            text = { ".*" },
          },
          click = "v:lua.ScSa",
        },
        -- Simulate the line number column without the right padding
        {
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        -- Show gitsigns at the position of line numbers' right padding
        {
          sign = {
            namespace = { "gitsigns" },
            colwidth = 1,
            wrap = true,
            foldclosed = true,
          },
          condition = {
            function(args)
              return vim.wo[args.win].number or vim.b[args.buf].gitsigns_status
            end,
          },
          click = "v:lua.ScSa",
        },
        -- Show the fold column with custom icons
        {
          text = {
            function(args)
              args.fold.close = ""
              args.fold.open = ""
              args.fold.sep = " "
              return builtin.foldfunc(args)
            end,
          },
          click = "v:lua.ScFa",
        },
      },
    }
  end,
}
