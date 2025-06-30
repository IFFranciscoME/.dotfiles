require('lualine').setup {
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        fmt = function(str)
          if #str > 23 then
            return string.format("%s...%s", str:sub(1,10), str:sub(-10))
          end
          return str
        end
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        fmt = function(str)
        if #str > 23 then
          local parts = {}
          for part in str:reverse():gmatch("[^/]+") do
            table.insert(parts, part:reverse())
          end
        if #parts >= 3 then
          return string.format(".../%s/%s/%s", parts[3], parts[2], parts[1])
        elseif #parts == 2 then
          return string.format(".../%s/%s", parts[2], parts[1])
        end
    end
  return str
        end
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {''},
    lualine_z = {'location'}
  }
}
