return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { 
      "rafamadriz/friendly-snippets" 
    },
    config = function()
      require("luasnip").setup({})
      require("luasnip.loaders.from_vscode").lazy_load()
      
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      
      ls.add_snippets("all", {
        s("pysh", { t("#!/usr/bin/env python") }),
        s("bashsh", { t("#!/usr/bin/bash") }),
        s("hpcuser", { t("hzafar@discover.nccs.nasa.gov") }),
        s("modpy", { t("module load python/GEOSpyD/Min24.4.0-0_py3.12") }),
        --[[
        s("sbatch", {
          t('#sbatch --account=s1460'), t('\n'),
          t('#sbatch --time=0:00:00'), t('\n'),
          t('#sbatch --constraint="[cas|sky|mil]”'), t('\n'),
          t('#SBATCH --output=slurm-%j-%a.log'),
        }) --]]
        s("sbatch", {
          t({
            '#sbatch --account=s1460',
            '#sbatch --time=0:00:00',
            '#sbatch --constraint="[cas|sky|mil]”',
            '#SBATCH --output=slurm-%j-%a.log'
           }),
      })
    })
    end,
  }
}
