local custom = require "custom"

---@type LazyPluginSpec
return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-calc" },
    -- { "saadparwaiz1/cmp_luasnip" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "lukas-reineke/cmp-under-comparator" },
  },
  opts = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    -- local has_words_before = function()
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    -- end

    return {
      ---@type cmp.ConfigSchema
      global = {
        completion = {
          completeopt = vim.o.completeopt,
        },
        window = {
          completion = {
            winblend = 0,
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
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
          ["<C-g>"] = cmp.mapping(cmp.mapping.close_docs(), { "i", "c" }),
          ["<CR>"] = cmp.mapping.confirm(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.jump(1)
            -- elseif has_words_before() then
            --   cmp.complete()
            else
              fallback() --Fallback to tabout of `ultimate-autopair` as expected
            end
          end, {
            "i",
            "s",
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
            "s",
            "c",
          }),
        },
        sources = {
          { name = "lazydev", group_index = 0 },
          { name = "nvim_lsp" },
          -- { name = "luasnip" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim
                  .iter(vim.api.nvim_list_bufs())
                  :filter(function(buf)
                    return vim.bo[buf].buftype == ""
                  end)
                  :totable()
              end,
            },
          },
          { name = "path" },
          { name = "calc" },
          { name = "orgmode" },
        },
        formatting = {
          format = lspkind.cmp_format(custom.cmp_format),
          fields = {
            "kind",
            "abbr",
            "menu",
          },
        },
        sorting = {
          comparators = {
            function(...)
              return require("cmp_buffer"):compare_locality(...)
            end,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            -- cmp.config.compare.scopes,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            -- cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      },
      cmdline = {
        [":"] = {
          completion = {
            completeopt = "menu,menuone,noselect",
          },
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
        },
        ["/"] = {
          completion = {
            completeopt = "menu,menuone,noselect",
          },
          sources = {
            { name = "buffer" },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.global(opts.global)
    for type, cmdlineopts in pairs(opts.cmdline) do
      cmp.setup.cmdline(type, cmdlineopts)
    end

    vim.api.nvim_create_autocmd("BufRead", {
      desc = "Setup cmp buffer crates source",
      pattern = "Cargo.toml",
      callback = function()
        cmp.setup.buffer {
          sources = {
            { name = "crates" },
          },
        }
      end,
    })
    vim.api.nvim_create_autocmd("Filetype", {
      desc = "Setup cmp buffer sql source",
      pattern = "sql",
      callback = function()
        cmp.setup.buffer {
          sources = {
            { name = "vim-dadbod-completion" },
          },
        }
      end,
    })
  end,
}
