local headlines = require "headlines"

headlines.setup {
  markdown = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  rmd = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  vimwiki = {
    source_pattern_start = "^{{{%a+",
    source_pattern_end = "^}}}$",
    dash_pattern = "^---+$",
    headline_pattern = "^=+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  org = {
    source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
    source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
    dash_pattern = "^-----+$",
    headline_pattern = "^%*+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
}
