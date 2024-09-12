vim.opt.exrc = true

-- Edit
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.includeexpr = "substitute(v:fname,'\\.','/','g')"
vim.opt.jumpoptions = "stack"
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.swapfile = false

-- Interface
vim.opt.confirm = true
vim.opt.splitkeep = "screen"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.conceallevel = 2
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
vim.opt.smoothscroll = true
vim.opt.pumblend = 12
vim.opt.pumheight = 12
vim.opt.colorcolumn = "81"
vim.opt.guifont = "Cascadia Code NF:h12"
vim.opt.shortmess:append "I"
vim.opt.fillchars = {
  eob = " ",
  diff = "╱",
  foldopen = "",
  foldclose = "",
  foldsep = "▕",
}
vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor/lCursor",
  "i-ci-ve:ver25-Cursor/lCursor",
  "r-cr-o:hor20-Cursor/lCursor",
}

---@diagnostic disable-next-line: param-type-mismatch
vim.opt.runtimepath:append(vim.fs.joinpath(vim.fn.stdpath "data", "site"))
