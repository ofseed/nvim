local a = s(
  {
    trig = "a",
    dsrc = "assert",
  },
  fmta([[assert!(<ends>)]], {
    ends = i(0),
  })
)

local ae = s(
  {
    trig = "ae",
    dsrc = "assert_eq",
  },
  fmta([[assert_eq!(<left>, <right>)]], {
    left = i(1),
    right = i(2),
  })
)

local bfn = s(
  {
    trig = "bfn",
    dsrc = "bench function",
  },
  fmta(
    [[
    #[bench]
    fn <name>(b: &mut test::Bencher) {
        b.iter(||);<ends>
    }
    ]],
    {
      name = i(1),
      ends = i(0),
    }
  )
)

local closure = s(
  {
    trig = "closure",
    dsrc = "closure",
  },
  fmta([[|<param>| <param_copy>]], {
    param = i(1),
    param_copy = d(2, insert_same_with, 1),
  })
)

-- TODO: Only in struct
local f = s(
  {
    trig = "f",
    dsrc = "field",
  },
  fmta([[<ident>: <type>]], {
    ident = i(1, "foo"),
    type = i(2, "u32"),
  })
)

local fmt = s(
  {
    trig = "fmt",
    dsrc = "format!",
  },
  fmta([[format!(<ends>)]], {
    ends = i(0),
  })
)

local fors = s(
  {
    trig = "for",
    dsrc = "iterate (for ... in ...)",
  },
  fmta(
    [[
    for <var> in <iterable> {
        <ends>
    }
    ]],
    {
      var = i(2),
      iterable = i(1),
      ends = i(0),
    }
  )
)

local fori = s(
  {
    trig = "fori",
    dsrc = "iterate over range (for ... in range)",
  },
  fmta(
    [[
    for <index> in <start>..<stop> {
        <ends>
    }
    ]],
    {
      index = i(3),
      start = i(1, "0"),
      stop = i(2),
      ends = i(0),
    }
  )
)

local ifl = s(
  {
    trig = "ifl",
    dsrc = "if let ... statement",
  },
  fmta(
    [[
    if let <pattern> = <expression> {
        <ends>
    }
    ]],
    {
      pattern = i(2),
      expression = i(1),
      ends = i(0),
    }
  )
)

local ifls = s(
  {
    trig = "ifl",
    dsrc = "if let Some(...) statement",
  },
  fmta(
    [[
    if let Some(<var>) = <expression> {
        <ends>
    }
    ]],
    {
      var = i(2),
      expression = i(1),
      ends = i(0),
    }
  )
)

local impl = s(
  {
    trig = "impl",
    dsrc = "impl Foo {} declaration",
  },
  fmta(
    [[
    impl <name> {
        <ends>
    }
    ]],
    {
      name = i(1),
      ends = i(0),
    }
  )
)

local implt = s(
  {
    trig = "implt",
    dsrc = "impl Foo for Bar {} declaration",
  },
  fmta(
    [[
    impl <trait> for <name> {
        <ends>
    }
    ]],
    {
      trait = i(1),
      name = i(2),
      ends = i(0),
    }
  )
)

local iter = s(
  {
    trig = "iter",
    dsrc = "iterate (for ... in ...)",
  },
  fmta(
    [[
    for <var> in <iterable> {
        <ends>
    }
    ]],
    {
      var = i(2),
      iterable = i(1),
      ends = i(0),
    }
  )
)

local loop = s(
  {
    trig = "loop",
    dsrc = "infinite loop",
  },
  fmta(
    [[
    loop {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local macro = s(
  {
    trig = "macro",
    dsrc = "macro_rules! declaration",
  },
  fmta(
    [[
    macro_rules! 6name9 {
        (6matcher9) => {6transcriber9};6ends9
    }
    ]],
    {
      name = i(1),
      matcher = i(2),
      transcriber = i(3),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local main = s(
  {
    trig = "main",
    dsrc = "main function",
  },
  fmta(
    [[
    fn main() {
        <ends>
    }
    ]],
    {
      ends = i(0),
    }
  )
)

local p = s(
  {
    trig = "p",
    dsrc = "println!",
  },
  fmta([[println!(<ends>)]], {
    ends = i(0),
  })
)

local pd = s(
  {
    trig = "pd",
    dsrc = "debug eprintln! value",
  },
  fmta([[eprintln!("<expression_copy> = {:?}", <expression>)]], {
    expression = i(1),
    expression_copy = d(2, insert_same_with, 1),
  })
)

-- TODO: Only in struct
local pf = s(
  {
    trig = "pf",
    dsrc = "pub field",
  },
  fmta([[pub <ident>: <type>]], {
    ident = i(1, "foo"),
    type = i(2, "u32"),
  })
)

local ppd = s(
  {
    trig = "ppd",
    dsrc = "debug pretty eprintln! value",
  },
  fmta([[eprintln!("<expression_copy> = {:#?}", <expression>)]], {
    expression = i(1),
    expression_copy = d(2, insert_same_with, 1),
  })
)

local pr = s(
  {
    trig = "pr",
    dsrc = "print!",
  },
  fmta([[print!(<ends>)]], {
    ends = i(0),
  })
)

local tfn = s(
  {
    trig = "tfn",
    dsrc = "test function",
  },
  fmta(
    [[
    #[test]
    fn <name>() {
        <ends>
    }
    ]],
    {
      name = i(1),
      ends = i(0),
    }
  )
)

local tmod = s(
  {
    trig = "tmod",
    dsrc = "test module",
  },
  fmta(
    [[
    #[cfg(test)]
    mod <name> {
        use super::*;

        <ends>
    }
    ]],
    {
      name = i(1),
      ends = i(0),
    }
  )
)

local whiles = s(
  {
    trig = "while",
    dsrc = "while loop",
  },
  fmta(
    [[
    while <condition> {
        <ends>
    }
    ]],
    {
      condition = i(1),
      ends = i(0),
    }
  )
)

local whilel = s(
  {
    trig = "whilel",
    dsrc = "while let ... loop",
  },
  fmta(
    [[
    while let <pattern> = <expression> {
        <ends>
    }
    ]],
    {
      pattern = i(2),
      expression = i(1),
      ends = i(0),
    }
  )
)

local whilels = s(
  {
    trig = "whilels",
    dsrc = "while let Some(...) loop",
  },
  fmta(
    [[
    while let Some(<var>) = <iterable> {
        <ends>
    }
    ]],
    {
      var = i(2),
      iterable = i(1),
      ends = i(0),
    }
  )
)

local wrt = s(
  {
    trig = "wrt",
    dsrc = "write! to buffer",
  },
  fmta([[write!(<buffer>, "<ends>")]], {
    ends = i(0),
  })
)

local wrtn = s(
  {
    trig = "wrtn",
    dsrc = "writeln! to buffer",
  },
  fmta([[writeln!(<buffer>, "<ends>")]], {
    ends = i(0),
  })
)

return {
  -- From IntelliJ
  a,
  ae,
  bfn,
  closure,
  f,
  fmt,
  fors,
  fori,
  ifl,
  ifls,
  impl,
  implt,
  iter,
  loop,
  macro,
  main,
  p,
  pd,
  pf,
  ppd,
  pr,
  tfn,
  tmod,
  whiles,
  whilel,
  whilels,
  wrt,
  wrtn,
}
