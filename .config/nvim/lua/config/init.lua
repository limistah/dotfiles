-- This file should be used for installation only.
-- I have intentionally ensure that the file fills my entire screen
-- Such that when it grows beyond that, it _MUST_ be refactored!
--
-- The configs could live in other directories such that:
-- required plugins are inside of $(dir)/lua/plugins/*.lua -- these are 
--   loaded directly into nvim and the configurations can be found below
-- 
-- optional plugins are inside of $(dir)/lua/custom/plugins/*.lua
require('config.health')
require('config.options')
require('config.autocmds')
require('config.lazy')
require('config.mappings')
require('config.netrw')
