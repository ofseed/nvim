local fors = s(
  {
    trig = "for",
    dscr = "Indexed for(;;) loop",
  },
  fmta(
    [[
    for (int 6index9 = 0; 6copy_index9 < 6upper_bound9; ++6copy_index9) {
      6ends9
    }
    ]],
    {
      -- TODO: query outer index
      index = i(1, "i"),
      copy_index = f(text_same_with, 1),
      upper_bound = i(2),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

return {
  -- From IntelliJ
  fors,
}
