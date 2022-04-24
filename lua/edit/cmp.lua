local ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify "Could not load cmp"
  return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
  vim.notify "Could not load luasnip"
  return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  vim.notify "Could not load lspkind"
  return
end

cmp.setup {
  window = {
    completion = {
      border = {
        "╭",
        "─",
        "╮",
        "│",
        "╯",
        "─",
        "╰",
        "│",
      },
    },
    documentation = {
      border = {
        "╭",
        "─",
        "╮",
        "│",
        "╯",
        "─",
        "╰",
        "│",
      },
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.close(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "c",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "c",
    }),
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
    { name = "path" },
    { name = "calc" },
    { name = "latex_symbols" },
    { name = "orgmode" },
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = 50,
      menu = {
        luasnip = "[SNP]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[VIM]",
        buffer = "[BUF]",
        path = "[PTH]",
        calc = "[CLC]",
        latex_symbols = "[TEX]",
        orgmode = "[ORG]",
      },
    },
    fields = {
      "kind",
      "abbr",
      "menu",
    },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

vim.cmd [[
autocmd FileType toml lua require("cmp").setup.buffer { sources = { { name = "crates" } } }
autocmd FileType sql,mysql,plsql lua require("cmp").setup.buffer { sources = {  { name = "vim-dadbod-completion" } } }
]]
