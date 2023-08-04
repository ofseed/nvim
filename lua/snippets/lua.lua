local closure = s(
  {
    trig = "closure",
    desc = "function() end",
  },
  fmta([[function(<params>) <ends> end]], {
    params = i(1),
    ends = i(0),
  })
)

local elseifs = s(
  {
    trig = "elseif",
    desc = "elseif expr then",
  },
  fmta(
    [[
    elseif <var> then
      <ends>
    ]],
    {
      var = i(1, "true"),
      ends = i(0),
    }
  )
)

local fors = s(
  {
    trig = "for",
    desc = "for i = 1, 10 do end",
  },
  fmta(
    [[
    for <var> = 1, <expr> do
      <ends>
    end
    ]],
    {
      var = i(1, "i"),
      expr = i(2, "10"),
      ends = i(0),
    }
  )
)

local fori = s(
  {
    trig = "fori",
    desc = "for i, v in ipairs(expr) do end",
  },
  fmta(
    [[
    for <var1>, <var2> in ipairs(<expr>) do
      <ends>
    end
    ]],
    {
      var1 = i(1, "i"),
      var2 = i(2, "v"),
      expr = i(3),
      ends = i(0),
    }
  )
)

local forp = s(
  {
    trig = "forp",
    desc = "for k, v in pairs(expr) do end",
  },
  fmta(
    [[
    for <var1>, <var2> in pairs(<expr>) do
      <ends>
    end
    ]],
    {
      var1 = i(1, "k"),
      var2 = i(2, "v"),
      expr = i(3),
      ends = i(0),
    }
  )
)

local func = s(
  {
    trig = "func",
    desc = "function functionName() end",
  },
  fmta(
    [[
    function <fn>(<params>)
      <ends>
    end
    ]],
    {
      fn = i(1, "funcName"),
      params = i(2),
      ends = i(0),
    }
  )
)

local ifs = s(
  {
    trig = "if",
    desc = "if expr then end",
  },
  fmta(
    [[
    if <var> then
      <ends>
    end
    ]],
    {
      var = i(1, "true"),
      ends = i(0),
    }
  )
)

local ifelse = s(
  {
    trig = "ifelse",
    desc = "if expr then else end",
  },
  fmta(
    [[
    if <var> then
      <ends>
    else
    end
    ]],
    {
      var = i(1, "true"),
      ends = i(0),
    }
  )
)

local lfunc = s(
  {
    trig = "lfunc",
    desc = "local function functionName() end",
  },
  fmta(
    [[
    local function <fn>(<params>)
      <ends>
    end
    ]],
    {
      fn = i(1, "funcName"),
      params = i(2),
      ends = i(0),
    }
  )
)

-- TODO: Only in function and query params
local paramsig = s(
  {
    trig = "paramsig",
    desc = "param signature",
  },
  fmta([[<params>]], {
    params = i(1),
  })
)

return {
  -- From IntelliJ EmmyLua
  closure,
  elseifs,
  fors,
  fori,
  forp,
  func,
  ifs,
  ifelse,
  lfunc,
  paramsig,
}
