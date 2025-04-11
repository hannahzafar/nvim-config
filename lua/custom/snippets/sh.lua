local ls = require("luasnip")

ls.add_snippets("sh", {
  ls.parser.parse_snippet("#!", "#!/usr/bin/bash\n\n"),
})

ls.add_snippets("sh", {
  ls.parser.parse_snippet("modpy", "module load python/GEOSpyD/Min24.4.0-0_py3.12"),
})

