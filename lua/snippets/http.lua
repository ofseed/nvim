local env = s(
  {
    trig = "env",
    dscr = "HTTP Client Environment",
  },
  fmta(
    [[
    <comma_before>"<env_name>": {
    "<var_name>": "<var_value>"
    }<comma_after>
    ]],
    {
      comma_before = i(1),
      env_name = i(2, "dev"),
      var_name = i(3, "name"),
      var_value = i(4, "value"),
      comma_after = i(5),
    }
  )
)

local fptr = s(
  {
    trig = "fptr",
    dscr = "POST file by multipart/form-data",
  },
  fmt(
    [[
    POST http://{host}/{path}
    Content-Type: multipart/form-data; boundary=WebAppBoundary

    --WebAppBoundary
    Content-Disposition: form-data; name="{field_name}"; filename="{file_name}"

    < {file_path}
    --WebAppBoundary--

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      field_name = i(3, "field_name"),
      file_name = i(4, "file.txt"),
      file_path = i(5, "./relative/path/to/file.txt"),
    }
  )
)

local gqlr = s(
  {
    trig = "gqlr",
    dscr = "GraphQL Request",
  },
  fmta(
    [[
    GRAPHQL <scheme>://<host>/<url_path>

    query {
        greetings
    }

    {
      "<var_name>": "<var_value>"
    }

    ###
    ]],
    {
      scheme = c(1, {
        t { "http" },
        t { "https" },
        t { "ws" },
        t { "wss" },
      }),
      host = i(2, "localhost:80"),
      url_path = i(3, "/graphql"),
      var_name = i(4, "varName"),
      var_value = i(5, "varValue"),
    }
  )
)

local gtr = s(
  {
    trig = "gtr",
    dscr = "GET http://example.com/get",
  },
  fmta(
    [[
    GET http://<host>/<path>
    <header>: <header_value>

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      header = i(3, "Accept"),
      header_value = i(4, "application/json"),
    }
  )
)

local gtrp = s(
  {
    trig = "gtrf",
    dscr = "GET http://example.com/get?id=99",
  },
  fmta(
    [[
    GET http://<host>/<path>?<param>=<value>
    <header>: <header_value>

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      param = i(3, "id"),
      value = i(4, "99"),
      header = i(5, "Accept"),
      header_value = i(6, "application/json"),
    }
  )
)

local mptr = s(
  {
    trig = "mptr",
    dscr = "POST multipart/form-data",
  },
  fmta(
    [[[
    POST http://<host>/<path>
    Content-Type: multipart/form-data; boundary=WebAppBoundary

    --WebAppBoundary
    Content-Disposition: form-data; name="<field_name>"

    <body>
    --WebAppBoundary--

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      field_name = i(3, "field-name"),
      body = i(4, "field-value"),
    }
  )
)

local ptr = s(
  {
    trig = "ptr",
    dscr = "POST http://example.com/add...",
  },
  fmta(
    [[
    POST http://<host>/<path>
    Content-Type: <header_value>

    <body>

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      header_value = i(3, "application/json"),
      body = i(4, "{}"),
    }
  )
)

local ptrp = s(
  {
    trig = "ptrp",
    dscr = "POST application/x-www-form-urlencoded",
  },
  fmta(
    [[
    POST http://<host>/<path>
    Content-Type: application/x-www-form-urlencoded

    <param1>=<value1> &
    <param2>=<value2>

    ###
    ]],
    {
      host = i(1, "localhost:80"),
      path = i(2, "/api/item"),
      param1 = i(3, "id"),
      value1 = i(4, "99"),
      param2 = i(5, "content"),
      value2 = i(6, "new-element"),
    }
  )
)

local ssl = s(
  {
    trig = "ssl",
    dscr = "SSL Configuration",
  },
  fmta(
    [[
    <comma_before>"SSLConfiguration": {
    "clientCertificate": "<cert_path>",
    "clientCertificateKey": "<key_path>",
    "verifyHostCertificate": <verify>,
    "hasCertificatePassphrase": <pass>
    }<comma_after>
    ]],
    {
      comma_before = i(1),
      cert_path = i(2, "file.pem"),
      key_path = i(3, "file.key"),
      verify = c(4, {
        t { "true" },
        t { "false" },
      }),
      pass = c(5, {
        t { "false" },
        t { "true" },
      }),
      comma_after = i(6),
    }
  )
)

local var = s(
  {
    trig = "var",
    dscr = "Environment variable",
  },
  fmta([[<comma_before>"<var_name>": "<var_value>"<comma_after>]], {
    comma_before = i(1),
    var_name = i(2, "name"),
    var_value = i(3, "value"),
    comma_after = i(4),
  })
)

local wsr = s(
  {
    trig = "wsr",
    dscr = "WebSocket Request",
  },
  fmta(
    [[
    WEBSOCKET <scheme>://<host>/<url_path>
    Content-Type: application/json // used only for IDE highlighting.
    // Highlighting is applied for each message independently.


    {
        "message": "<text_1>"
    }
    === wait-for-server
    {
        "message": "<text_2>"
    }
    ===
    {
        "message": "<text_3>"
    }

    ###
    ]],
    {
      scheme = c(1, {
        t { "ws" },
        t { "wss" },
      }),
      host = i(2, "localhost:80"),
      url_path = i(3, "/websocket"),
      text_1 = i(4, "Send when the WebSocket connection is opened"),
      text_2 = i(
        5,
        "Wait for the server message and send the current message as response"
      ),
      text_3 = i(
        6,
        "Send after previous message without waiting for the server message"
      ),
    }
  )
)

return {
  env,
  fptr,
  gqlr,
  gtr,
  gtrp,
  mptr,
  ptr,
  ptrp,
  ssl,
  var,
  wsr,
}
