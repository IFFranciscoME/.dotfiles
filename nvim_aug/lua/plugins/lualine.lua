require('lualine').setup {
  options = {
    theme = 'nord'
  },
  sections = {
    
    lualine_a = {
      'mode',
    },
    
    lualine_b = {
      {
        'branch',
        fmt = function(str)
          if #str > 12 then
            return string.format("%s...%s", str:sub(0, 4), str:sub(-5))
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
        if #str > 30 then
          local parts = {}
          for part in str:reverse():gmatch("[^/]+") do
            table.insert(parts, part:reverse())
          end
        if #parts >= 4 then
          return string.format(".../%s/%s/%s/%s", parts[4], parts[3], parts[2], parts[1])
        elseif #parts == 3 then
          return string.format(".../%s/%s/%s", parts[3], parts[2], parts[1])
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
