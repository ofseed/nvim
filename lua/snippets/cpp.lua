local iter = s(
  {
    trig = "iter",
    dsrc = "Iterate range (C++11)",
  },
  fmta(
    [[
    for (6auto_type9 6var9 : 6container9) {
      6ends9
    }
    ]],
    {
      -- TODO: Query var type
      auto_type = i(2, "const auto"),
      var = i(3, "item"),
      container = i(1, "range"),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local itit = s(
  {
    trig = "itit",
    dsrc = "Iterate using begin/end member functions",
  },
  fmta(
    [[
    for (6iter_type9 6iter9 = 6container9.begin(); 6copy_iter9 != 6copy_container9.end(); ++6copy_iter9) {
      6ends9
    }
    ]],
    {
      -- TODO: Query var type
      iter_type = i(2, "auto"),
      iter = i(3, "begin"),
      container = i(1, "container"),
      copy_iter = f(text_same_with, 3),
      copy_container = f(text_same_with, 1),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

return {
  iter,
  itit,
}
