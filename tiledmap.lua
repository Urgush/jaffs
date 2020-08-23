-- Aufruf aus main.lua mit jaffs(.lua)
function loadTiledMap(path)
  
  -- require lädt jaffs(.lua)
  local map = require(path)

  map.quads = {}

  -- Zugriff auf jaffs.lua tilesets => Definition des .png files
  local jaffs = map.tilesets[1]
  map.tileset = jaffs
  map.image = love.graphics.newImage(jaffs.image)

  -- Laden der Quads
  for y = 0, (jaffs.imageheight / jaffs.tileheight) - 1 do
    for x = 0, (jaffs.imagewidth / jaffs.tilewidth) -1 do
      local quad = love.graphics.newQuad(
        x * jaffs.tilewidth,
        y * jaffs.tileheight,
        jaffs.tilewidth,
        jaffs.tileheight,
        jaffs.imagewidth,
        jaffs.imageheight
      )
      table.insert(map.quads, quad)
    end
  end

  function map:draw()
    -- layers in jaffs(.lua) definiert als Kachelebene 1 und 2
    for i, layer in ipairs(self.layers) do
      for y = 0, layer.height - 1 do
        for x = 0, layer.width - 1 do
          local index = (x + y * layer.width) + 1
          local tid = layer.data[index]

          if tid ~= 0 then
            local quad = self.quads[tid]
            local xx = x * self.tileset.tilewidth
            local yy = y * self.tileset.tileheight
            love.graphics.draw(
              self.image,
              quad,
              xx,
              yy
            )
          end
          
        end
      end
    end
  end

  return map
  
end
