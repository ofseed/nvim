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
        {
          sign = {
            name = { ".*" },
            text = { ".*" },
          },
          click = "v:lua.ScSa",
        },
        {
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
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
