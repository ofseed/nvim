local arf

local assert = s(
  {
    trig = "assert",
    dsrc = "console.assert()",
  },
  fmta([[console.assert(<ends>)]], {
    ends = i(0),
  })
)

local defn = s(
  {
    trig = "defn",
    dsrc = "Inserts define() expression",
  },
  fmta(
    [[
    define(["<module_ref>"], function(<module_var>) {
      <ends>
    });
    ]],
    {
      module_ref = i(1),
      module_var = d(2, insert_same_with, 1),
      ends = i(0),
    }
  )
)

local error = s(
  {
    trig = "error",
    dsrc = "console.error()",
  },
  fmta([[console.error(<ends>)]], {
    ends = i(0),
  })
)

local exportall = s(
  {
    trig = "exportall",
    dsrc = "Export statement - export * from 'a'",
  },
  fmta(
    [[
    export * from "<module>";
    <ends>
    ]],
    {
      module = i(1),
      ends = i(0),
    }
  )
)

local exportfrom = s(
  {
    trig = "exportfrom",
    dsrc = "Export statement - export { b } from 'a'",
  },
  fmta([[export { <items><ends> } from "<module>";]], {
    items = i(2),
    ends = i(0),
    module = i(1),
  })
)

local exportitems = s(
  {
    trig = "exportitems",
    dsrc = "Export statement - export {  b }",
  },
  fmta([[export { <items><ends> }]], {
    items = i(1),
    ends = i(0),
  })
)

local flow = s(
  {
    trig = "flow",
    dsrc = "Insert @flow annotation",
  },
  fmta([[// @flow<ends>]], {
    ends = i(0),
  })
)

local fori = s(
  {
    trig = "fori",
    dsrc = "Create iteration loop",
  },
  fmta(
    [[
    for (6varkind9 6index9 = 0; 6indexf9 < 6limit9; 6indexf9++)
      6ends9
    }
    ]],
    {
      varkind = c(1, {
        t { "let" },
        t { "var" },
      }),
      index = i(2),
      limit = i(3),
      indexf = f(text_same_with, 2),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local forin = s(
  {
    trig = "forin",
    dsrc = "Iterate (for..in)",
  },
  fmta(
    [[
    for (<varkind> <var> in <array>) {
      <ends>
    }
    ]],
    {
      varkind = c(1, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      var = d(3, insert_same_with_and_append, 2, { user_args = { "Key" } }),
      array = i(2, "array"),
      ends = i(0),
    }
  )
)

local forof = s(
  {
    trig = "forof",
    dsrc = "Iterate (for..of)",
  },
  fmta(
    [[
    for (<varkind> <var> of <array>) {
      <ends>
    }
    ]],
    {
      varkind = c(1, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      var = d(3, insert_same_with_and_append, 2, { user_args = { "Element" } }),
      array = i(2, "array"),
      ends = i(0),
    }
  )
)

local importdefault = s(
  {
    trig = "importdefault",
    dsrc = "Import statement - import b from 'a'",
  },
  fmta(
    [[
    import <item> from "<module>";
    <ends>
    ]],
    {
      item = d(2, insert_same_with_last_path, 1),
      module = i(1),
      ends = i(0),
    }
  )
)

local importitems = s(
  {
    trig = "importitem",
    dsrc = "Import statement - import { b } from 'a'",
  },
  fmta([[import { <item><ends> } from "<module>";]], {
    item = i(2),
    module = i(1),
    ends = i(0),
  })
)

local importns = s(
  {
    trig = "importns",
    dsrc = "Import statement - import * as b from 'a'",
  },
  fmta(
    [[
    import * as <item> from "<module>";
    <ends>
    ]],
    {
      item = d(2, insert_same_with, 1),
      module = i(1),
      ends = i(0),
    }
  )
)

local info = s(
  {
    trig = "info",
    dsrc = "console.info()",
  },
  fmta([[console.info(<ends>)]], {
    ends = i(0),
  })
)

local itar = s(
  {
    trig = "itar",
    dsrc = "Iterate elements of array",
  },
  fmta(
    [[
    for (6varkind9 6index9 = 0; 6indexf9 < 6array9.length; 6indexf9++) {
      6varkind29 6element9 = 6arrayf9[6indexf9];
      6ends9
    }
    ]],
    {
      varkind = c(1, {
        t { "let" },
        t { "var" },
      }),
      index = i(2, "i"),
      array = i(3, "array"),
      indexf = f(text_same_with, 2),
      element = d(5, insert_same_with_and_append, 3, { user_args = { "Element" } }),
      arrayf = f(text_same_with, 3),
      varkind2 = c(4, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local iter = s(
  {
    trig = "iter",
    dsrc = "Iterate (for..of)",
  },
  fmta(
    [[
    for (<varkind> <var> of <array>) {
      <ends>
    }
    ]],
    {
      varkind = c(1, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      var = d(3, insert_same_with_and_append, 2, { user_args = { "Element" } }),
      array = i(2, "array"),
      ends = i(0),
    }
  )
)

local itera = s(
  {
    trig = "itera",
    dsrc = "Iterate (for await..of)",
  },
  fmta(
    [[
    for await (<varkind> <var> of <array>) {
      <ends>
    }
    ]],
    {
      varkind = c(1, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      var = d(3, insert_same_with_and_append, 2, { user_args = { "Element" } }),
      array = i(2, "array"),
      ends = i(0),
    }
  )
)

local itin = s(
  {
    trig = "itin",
    dsrc = "Iterate (for..in)",
  },
  fmta(
    [[
    for (<varkind> <var> in <array>) {
      <ends>
    }
    ]],
    {
      varkind = c(1, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      var = d(3, insert_same_with_and_append, 2, { user_args = { "Key" } }),
      array = i(2, "array"),
      ends = i(0),
    }
  )
)

local log = s(
  {
    trig = "log",
    dsrc = "console.log()",
  },
  fmta([[console.log(<ends>)]], {
    ends = i(0),
  })
)

local moduleexports = s({
  trig = "moduleexports",
  dsrc = "Export statement - module.exports = a",
}, {
  t "module.exports = ",
})

-- TODO: Only in imports
local ref = s(
  {
    trig = "ref",
    dsrc = "Inserts reference path comment",
  },
  fmt(
    [[
    ///<reference path="{path}" />
    {ends}
    ]],
    {
      path = i(1),
      ends = i(0),
    }
  )
)

local ritar = s(
  {
    trig = "ritar",
    dsrc = "Iterate elements of array in reverse order",
  },
  fmta(
    [[
    for (6varkind9 6index9 = 6array9.length - 1; 6indexf9 >= 0; 6indexf9--) {
      6varkind29 6element9 = 6arrayf9[6indexf9];
      6ends9
    }
    ]],
    {
      varkind = c(1, {
        t { "let" },
        t { "var" },
      }),
      index = i(2, "i"),
      array = i(3, "array"),
      indexf = f(text_same_with, 2),
      element = d(5, insert_same_with_and_append, 3, { user_args = { "Element" } }),
      arrayf = f(text_same_with, 3),
      varkind2 = c(4, {
        t { "const" },
        t { "let" },
        t { "var" },
      }),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local trace = s(
  {
    trig = "trace",
    dsrc = "console.trace()",
  },
  fmta([[console.trace(<ends>)]], {
    ends = i(0),
  })
)

local us = s(
  {
    trig = "us",
    dsrc = "Inserts 'use strict' statement",
  },
  fmta(
    [[
    "use strict";
    <ends>
    ]],
    {
      ends = i(0),
    }
  )
)

local warn = s(
  {
    trig = "warn",
    dsrc = "console.warn()",
  },
  fmta([[console.warn(<ends>)]], {
    ends = i(0),
  })
)

return {
  -- From IntelliJ
  assert,
  defn,
  error,
  exportall,
  exportfrom,
  exportitems,
  flow,
  fori,
  forin,
  forof,
  importdefault,
  importitems,
  importns,
  itar,
  iter,
  itera,
  itin,
  info,
  log,
  moduleexports,
  ref,
  ritar,
  trace,
  us,
  warn,
}
