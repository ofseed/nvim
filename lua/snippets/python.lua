local compd = s(
  {
    trig = "compd",
    dscr = "Dict comprehension",
  },
  fmta([[{ <key_expr>: <val_expr> for <var> in <iterable>}]], {
    key_expr = d(3, insert_same_with, 2),
    val_expr = d(4, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
  })
)

local compdi = s(
  {
    trig = "compdi",
    dscr = "Dict comprehension with 'if'",
  },
  fmta([[{<key_expr>: <val_expr> for <var> in <iterable> if <var_expr_if>}]], {
    key_expr = d(3, insert_same_with, 2),
    val_expr = d(4, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
    var_expr_if = d(5, insert_same_with, 2),
  })
)

local compg = s(
  {
    trig = "compg",
    dscr = "Generator comprehension",
  },
  fmta([[(<expr> for <var> in <iterable>)]], {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
  })
)

local compgi = s(
  {
    trig = "compgi",
    dscr = "Generator comprehension with 'if'",
  },
  fmta([[(<expr> for <var> in <iterable> if <var_expr_if>)]], {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
    var_expr_if = d(4, insert_same_with, 2),
  })
)

local compl = s(
  {
    trig = "compl",
    dscr = "List comprehension",
  },
  fmta("[<expr> for <var> in <iterable>]", {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
  })
)

local compli = s(
  {
    trig = "compli",
    dscr = "List comprehension with 'if'",
  },
  fmta("[<expr> for <var> in <iterable> if <var_expr_if>]", {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
    var_expr_if = d(4, insert_same_with, 2),
  })
)

local comps = s(
  {
    trig = "comps",
    dscr = "Set comprehension",
  },
  fmta([[{<expr> for <var> in <iterable>}]], {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
  })
)

local compsi = s(
  {
    trig = "compsi",
    dscr = "Set comprehension with 'if'",
  },
  fmta([[{<expr> for <var> in <iterable> if <var_expr_if>}]], {
    expr = d(3, insert_same_with, 2),
    var = i(2),
    iterable = i(1),
    var_expr_if = d(4, insert_same_with, 2),
  })
)

local iter = s(
  {
    trig = "iter",
    dscr = "Iterate (for ... in ...)",
  },
  fmta(
    [[
    for <var> in <iterable>:
        <ends>
    ]],
    {
      var = i(2),
      iterable = i(1),
      ends = i(0),
    }
  )
)

local itere = s(
  {
    trig = "itere",
    dscr = "Iterate (for ... in enumerate)",
  },
  fmta(
    [[
    for <index>, <var> in enumerate(<iterable>):
        <ends>
    ]],
    {
      index = i(3, "i"),
      var = i(2),
      iterable = i(1),
      ends = i(0),
    }
  )
)

local main = s(
  {
    trig = "main",
    dscr = "if __name__ == '__main__'",
  },
  fmta(
    [[
    if __name__ == '__main__':
        <ends>
    ]],
    {
      ends = i(0),
    }
  )
)

-- TODO: Only in class
local prop = s(
  {
    trig = "prop",
    dscr = "Property getter",
  },
  fmta(
    [[
    @property
    def <name>(self):
        return <ends>
    ]],
    {
      name = i(1),
      ends = i(0),
    }
  )
)

-- TODO: Only in class
local props = s(
  {
    trig = "props",
    dscr = "Property getter/setter",
  },
  fmta(
    [[
    @property
    def <name>(self):
        return <ends>

    @<namef>.setter
    def <namef>(self, value):
        pass
    ]],
    {
      name = i(1),
      ends = i(0),
      namef = f(text_same_with, 1),
    }
  )
)

-- TODO: Only in class
local propsd = s(
  {
    trig = "propsd",
    dscr = "Property getter/setter/deleter",
  },
  fmta(
    [[[
    @property
    def <name>(self):
        return <ends>

    @<namef>.setter
    def <namef>(self, value):
        pass

    @<namef>.deleter
    def <namef>(self):
        pass
    ]],
    {
      name = i(1),
      ends = i(0),
      namef = f(text_same_with, 1),
    }
  )
)

-- TODO: Only in class
local super = s(
  {
    trig = "super",
    dscr = "'super(...)' call",
  },
  fmta([[super(<args>).<method>(<ends>)]], {
    args = i(1),
    method = i(2),
    ends = i(3),
  })
)

return {
  -- From InteliJ
  compd,
  compdi,
  compg,
  compgi,
  compl,
  compli,
  comps,
  compsi,
  iter,
  itere,
  main,
  prop,
  props,
  propsd,
  super,
}
