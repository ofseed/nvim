local ok, lilypond = pcall(require, "nvls")
if not ok then
  vim.notify "Could not load nvim-lilypond-suite"
  return
end

lilypond.setup {
  lilypond = {
    mappings = {
      player = "<F3>",
      compile = "<F5>",
      open_pdf = "<F6>",
      switch_buffers = "<A-Space>",
      insert_version = "<F4>",
      hyphenation = "<F12>",
      hyphenation_change_lang = "<F11>",
      insert_hyphen = "<leader>ih",
      add_hyphen = "<leader>ah",
      del_next_hyphen = "<leader>dfh",
      del_prev_hyphen = "<leader>dFh",
      del_selected_hyphen = "<leader>dh",
    },
    options = {
      pitches_language = "default",
      output = "pdf",
      main_file = "main.ly",
      main_folder = "%:p:h",
      hyphenation_language = "en_DEFAULT",
    },
  },
  latex = {
    mappings = {
      compile = "<F5>",
      open_pdf = "<F6>",
      lilypond_syntax = "<F3>",
    },
    options = {
      clean_logs = false,
    },
  },
  player = {
    mappings = {
      quit = "q",
      play_pause = "p",
      loop = "<A-l>",
      backward = "h",
      small_backward = "<S-h>",
      forward = "l",
      small_forward = "<S-l>",
      decrease_speed = "j",
      increase_speed = "k",
      halve_speed = "<S-j>",
      double_speed = "<S-k>",
    },
    options = {
      row = "2%",
      col = "99%",
      width = "37",
      height = "1",
      border_style = "single",
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  },
}
