local insert_capitalize = function(args)
  local text = args[1][1]
  local placeholder = text:sub(1, 1):upper() .. text:sub(2)
  return sn(nil, {
    i(1, placeholder),
  })
end

local lazyImport = s(
  {
    trig = "lazyImport",
    dsrc = "const Component = lazy(() => import('path'))",
  },
  fmt([[const {name} = lazy(() => import('{path}'))]], {
    name = i(1),
    path = i(2),
  })
)

local useCallback = s(
  {
    trig = "useCallback",
    dsrc = "const name = useCallback(() => {}, [])",
  },
  fmta(
    [[[
    const 6cachedFn9 = useCallback(() => {
      6ends9
    }, [])
    ]],
    {
      cachedFn = i(1),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local useContext = s(
  {
    trig = "useContext",
    dsrc = "const value = useContext(context)",
  },
  fmta([[const <value> = useContext(<context>)]], {
    value = i(1),
    context = i(2),
  })
)

local useEffect = s(
  {
    trig = "useEffect",
    dsrc = "useEffect(() => {}, [])",
  },
  fmta(
    [[
    useEffect(() => {
      6ends9
    }, [])
    ]],
    {
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local useLayoutEffect = s(
  {
    trig = "useLayoutEffect",
    dsrc = "useLayoutEffect(() => {}, [])",
  },
  fmta(
    [[
    useLayoutEffect(() => {
      6ends9
    }, [])
    ]],
    {
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local useMemo = s(
  {
    trig = "useMemo",
    dsrc = "const cachedValue = useMemo(() => {}, [])",
  },
  fmta(
    [[
    const 6cachedValue9 = useMemo(() => {
      6ends9
    }, [])
    ]],
    {
      cachedValue = i(1),
      ends = i(0),
    },
    {
      delimiters = "69",
    }
  )
)

local useReducer = s(
  {
    trig = "useReducer",
    dsrc = "const [state, dispatch] = useReducer(params)",
  },
  fmta(
    [[
    const [<state>, <dispatch>] = useReducer(<params>)
    ]],
    {
      state = i(1),
      dispatch = i(2),
      params = i(3),
    }
  )
)

local useRef = s(
  {
    trig = "useRef",
    dsrc = "const ref = useRef(initialValue)",
  },
  fmta([[const <ref> = useRef(<initialValue>)]], {
    ref = i(1),
    initialValue = i(2),
  })
)

local useState = s(
  {
    trig = "useState",
    dsrc = "const [state, setState] = useState()",
  },
  fmta([[const [<state>, set<State>] = useState(<ends>)]], {
    state = i(1),
    State = d(2, insert_capitalize, 1),
    ends = i(0),
  })
)

return {
  lazyImport,
  useCallback,
  useContext,
  useEffect,
  useLayoutEffect,
  useMemo,
  useReducer,
  useRef,
  useState,
}
