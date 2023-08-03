local insert_first_character = function(args, _, _, user_arg1)
  local text = args[1][1]
  -- get first character of text
  local placeholder = user_arg1
  if text ~= "" then
    placeholder = text:sub(1, 1)
  end
  return sn(nil, {
    i(1, placeholder),
  })
end

-- TeDO: Only in statements
local colon = s(
  {
    trig = ":",
    dsrc = "Variable declaration :=",
  },
  fmta([[<name> := <value>]], {
    name = i(1, "name"),
    value = i(2),
  })
)

local bench = s(
  {
    trig = "bench",
    dsrc = "Benchmark",
  },
  fmta(
    [[
    func Benchmark6name9(b *testing.B) {
        for i := 0; i < b.N; i++ {
            6ends9
        }
    }
    ]],
    {
      name = i(1, "Name"),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local consts = s(
  {
    trig = "conts",
    dsrc = "Constants declaration",
  },
  fmta(
    [[
    const (
        <name> = <value><ends>
    )
    ]],
    {
      name = i(1, "name"),
      value = i(2),
      ends = i(0),
    }
  )
)

local err = s(
  {
    trig = "err",
    dsrc = "If error",
  },
  fmta(
    [[
    if err != nil {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local fori = s(
  {
    trig = "fori",
    dsrc = "Indexed for loop",
  },
  fmta(
    [[
    for 6index9 := 0; 6indexf9 < 6limit9; 6indexf9++ {
       6ends9
    }
    ]],
    {
      index = i(1, "i"),
      indexf = f(text_same_with, 1),
      limit = i(2),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local forr = s(
  {
    trig = "forr",
    dsrc = "Range for loop",
  },
  fmta(
    [[
    for <key>, <value> := range <collection> {
        <ends>
    }
    ]],
    {
      key = i(1, "key"),
      value = i(2, "value"),
      collection = i(3, "collection"),
      ends = i(0),
    }
  )
)

local fuzz = s(
  {
    trig = "fuzz",
    dsrc = "Fuzzing",
  },
  fmta(
    [[
    func Fuzz<name>(f *testing.F) {
        <ends>
    }
    ]],
    {
      name = i(1, "Name"),
      ends = i(0),
    }
  )
)

local imports = s(
  {
    trig = "imports",
    dsrc = "Imports declaration",
  },
  fmta(
    [[
    import (
        "<ends>"
    )
    ]],
    {
      ends = i(0),
    }
  )
)

local init = s(
  {
    trig = "init",
    dsrc = "Init function",
  },
  fmta(
    [[
    func init() {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local iota = s(
  {
    trig = "iota",
    dsrc = "Iota constant declaration",
  },
  fmta([[const <name> <type> = iota]], {
    name = i(1, "name"),
    type = i(2),
  })
)

local main = s(
  {
    trig = "main",
    dsrc = "Main function",
  },
  fmta(
    [[
    func main() {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local map = s(
  {
    trig = "map",
    dsrc = "Map type",
  },
  fmta([[map[<key_type>]<value_type>]], {
    key_type = i(1),
    value_type = i(2),
  })
)

local meth = s(
  {
    trig = "meth",
    dsrc = "Method",
  },
  fmta(
    [[
    func (<receiver> <receiver_type>) <name>(<param>) <return_type> {
        <ends>
    }
    ]],
    {
      receiver = d(2, insert_first_character, 1, { user_args = { "receiver" } }),
      receiver_type = i(1),
      name = i(3, "name"),
      param = i(4),
      return_type = i(5),
      ends = i(0),
    }
  )
)

local p = s(
  {
    trig = "p",
    dsrc = "Package declaration",
  },
  fmta([[package <name>]], {
    name = i(1, "name"),
  })
)

local printf = s(
  {
    trig = "printf",
    dsrc = "printf",
  },
  fmta([[fmt.Printf("%<ends>", <var>)]], {
    var = i(1),
    ends = i(0),
  })
)

local test = s(
  {
    trig = "test",
    dsrc = "Test",
  },
  fmta(
    [[
    func Test<name>(t *testing.T) {
        <ends>
    }
    ]],
    {
      name = i(1, "Name"),
      ends = i(0),
    }
  )
)

local types = s(
  {
    trig = "types",
    dsrc = "Types declaration",
  },
  fmta(
    [[
    type {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local vars = s(
  {
    trig = "vars",
    dsrc = "Variables declaration",
  },
  fmta(
    [[
    var (
        <name> = <value><ends>
    )
    ]],
    {
      name = i(1, "name"),
      value = i(2),
      ends = i(0),
    }
  )
)

-- TODO: Auto filed name
local json = s(
  {
    trig = "json",
    dsrc = '`json:""`',
  },
  fmta([[`json:"<filed_name>"<ends>`]], {
    filed_name = i(1, "filed_name"),
    ends = i(0),
  })
)

-- TODO: Auto filed name
local xml = s(
  {
    trig = "xml",
    dsrc = '`xml:""`',
  },
  fmta([[`xml:"<filed_name>"<ends>`]], {
    filed_name = i(1, "filed_name"),
    ends = i(0),
  })
)

return {
  -- From IntelliJ
  colon,
  bench,
  consts,
  err,
  fori,
  forr,
  fuzz,
  imports,
  init,
  iota,
  main,
  map,
  meth,
  p,
  printf,
  test,
  types,
  vars,
  json,
  xml,
}
