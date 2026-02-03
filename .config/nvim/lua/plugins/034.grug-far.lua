---@module "lazy"
---@type LazySpec

-- Grug Far: Find and Replace
-- Advanced find and replace with live preview.
-- Supports regex patterns and multi-file replacements.
-- See: https://github.com/MagicDuck/grug-far.nvim

return {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    keys = {
        {
            '<leader>cg',
            function()
                local grug = require 'grug-far'
                grug.open { transient = true }
            end,
            desc = 'GrugFar',
            mode = { 'n', 'v' },
        },
    },
    opts = {
        -- Disable folding.
        folding = { enabled = false },
        -- Don't numerate the result list.
        resultLocation = { showNumberLabel = false },
    },
}