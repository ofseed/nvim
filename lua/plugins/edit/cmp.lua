local custom = require "custom"

---@type LazyPluginSpec
return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  init = function()
    local filetype = { "dap-repl", "dapui_watches", "dapui_hover" }
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Setup cmp dap sources",
      pattern = filetype,
      callback = function()
        local cmp = require "cmp"
        cmp.setup.filetype(filetype, {
          sources = {
            { name = "dap" },
          },
        })
      end,
    })
  end,
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "rcarriga/cmp-dap" },
    -- { "saadparwaiz1/cmp_luasnip" },
    { "lukas-reineke/cmp-under-comparator" },
    { "kristijanhusak/vim-dadbod-completion", enabled = false },
  },
  opts = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    -- local has_words_before = function()
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    -- end

    local function is_dap_buffer(bufnr)
      local filetype = vim.bo[bufnr or 0].filetype
      if vim.startswith(filetype, "dapui_") then
        return true
      end
      if filetype == "dap-repl" then
        return true
      end

      return false
    end

    return {
      ---@type cmp.ConfigSchema
      global = {
        enabled = function()
          -- cmp-dap will be available in prompt buffer
          return vim.bo[0].buftype ~= "prompt" or is_dap_buffer()
        end,
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
            if luasnip.expand_or_locally_jumpable() then
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
            if luasnip.jumpable(-1) then
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
        sources = cmp.config.sources(
          -- Group sources
          {
            { name = "lazydev" },
          },
          {
            { name = "nvim_lsp" },
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
            { name = "orgmode" },
          }
        ),
        formatting = {
          format = lspkind.cmp_format(custom.cmp_format),
          fields = {
            "kind",
            "abbr",
            "menu",
          },
        },
        sorting = {
          priority_weight = 2,
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
            { name = "lazydev" },
          }, {
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
    -- vim.api.nvim_create_autocmd("Filetype", {
    --   desc = "Setup cmp buffer sql source",
    --   pattern = "sql",
    --   callback = function()
    --     cmp.setup.buffer {
    --       sources = {
    --         { name = "vim-dadbod-completion" },
    --       },
    --     }
    --   end,
    -- })
  end,
}
