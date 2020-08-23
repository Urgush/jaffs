-- load tiledmap.lua
require "tiledmap"

function love.load()
  -- Hauptfenster konfigurieren
  love.window.setMode(800,600,{fullscreen=true})

  -- Definiert in tiledmap.lua
  _G.map = loadTiledMap "jaffs"
end

function love.update(dt)
  
end

function love.keypressed(key, unicode)
  if unicode == 'q' then
    love.event.quit()
  end
end


function love.draw()

  -- Scale auf Ausgabe (Verhältnis muss noch nachvollzogen werden)
  love.graphics.push()
  love.graphics.scale(3.3, 3.3)
  -- map.draw(map)
  _G.map:draw() 
  love.graphics.pop()

end
