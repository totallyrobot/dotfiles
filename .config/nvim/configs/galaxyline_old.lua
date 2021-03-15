local galaxyline = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')

-- local colors = require('galaxyline.colors').default
galaxyline.section.left[1] = {
        ViMode = {
                provider = function()
                        local modeLookupTable = {
                                i = " Insert",
                                n = " Normal",
                                v = " Visual",
                                c = " Command",
                        }
                        local modeColorLookupTable = {
                             i = "#50FA7B",
                             n = "#FFFFFF",
                             v = "#BD93F9",
                             c = "#FFFFFF",
                        }
                        vim.api.nvim_command('hi GalaxyViMode guifg='..modeColorLookupTable[vim.fn.mode()])
                        return " " .. modeLookupTable[vim.fn.mode()] .. " "
                end,
                highlight = {colors.fg, "#212121", 'bold'},
                separator = '',
                separator_highlight = {"#212121", "#1C1F24"},
        }
}

galaxyline.section.left[2] = {
        FileIcon = {
                provider = 'FileIcon',
                condition = condition.buffer_not_empty,
                highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, "#1c1f24"},
        },
}

galaxyline.section.left[3] = {
        FileName = {
                provider = 'FileName',
--                icon = buffer.get_buffer_type_icon,
                highlight = {"#ffffff","#1C1F24"},
                separator = '',
                separator_highlight = {"#1c1f24", "#282C34"},
        }
}

gls.right[1] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

