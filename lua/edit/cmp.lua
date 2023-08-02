local config = function()

local cmp = require "cmp"

local luasnip = require "luasnip"

local lspkind = require "lspkind"

local custom = require "custom"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup {
  window = {
    completion = {
      border = custom.border,
      col_offset = -3,
    },
    documentation = {
      border = custom.border,
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
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
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
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "c",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
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

end

return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          desc = "Enable cmp capabilities",
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local original_capabilities = client.server_capabilities

            client.server_capabilities = vim.tbl_deep_extend("force", original_capabilities, cmp_capabilities)
          end,
        })
      end,
    },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-calc" },
    { "saadparwaiz1/cmp_luasnip" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "lukas-reineke/cmp-under-comparator" },
  },
  config = config,
}
