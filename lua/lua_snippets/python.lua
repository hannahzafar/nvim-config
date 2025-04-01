local ls = require("luasnip")

ls.add_snippets("python", {
  ls.parser.parse_snippet("#!", "#!/usr/bin/env python3\n\n"),
})

