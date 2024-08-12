local function getHlColor(group, attribute)
  -- attribute = foreground | background
  local hl = vim.api.nvim_get_hl_by_name(group, true)
  local color = hl[attribute]
  if color then
    return string.format("#%06x", color)
  end
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

			-- set linenumber colors
			-- local stringColor = vim.api.nvim_get_hl_by_name("String", true).foreground
			local stringColor = getHlColor("String", "foreground")
			-- local variableColor = getHlColor("@variable", "foreground")
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = stringColor })
			-- vim.api.nvim_set_hl(0, "LineNr", { fg = variableColor })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = stringColor  })

			-- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineError', { underline = true, sp = '#FF0000', undercurl = true })
			-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = '#FF0000' })
		end,
	},
}

-- return {
--   {
--     "connorholyday/vim-snazzy",
--     name = "snazzy",
--     config = function()
--       vim.cmd("colorscheme snazzy")
--       --
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
--       -- set linenumber colors
--       -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#1cffa4' })
--       -- vim.api.nvim_set_hl(0, 'LineNr', { fg='#1cffa4' })
--       -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#1cffa4' })
--
--       -- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineError', { underline = true, sp = '#FF0000', undercurl = true })
--       -- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = '#FF0000' })
--     end,
--   }
-- }

-- return {
--   {
--     "bluz71/vim-nightfly-guicolors",
--     name = "nightfly",
--     config = function()
--       -- "rose-pine/neovim"
--       vim.cmd("colorscheme nightfly")
--       -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
--   }
-- }
