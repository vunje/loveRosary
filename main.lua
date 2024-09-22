-- Sti= require("plugins.Simple-Tiled-Implementation.sti")

local Gamera = require("plugins.gamera.gamera")
local camera = Gamera.new(0,0,2000,2000)

-- Camera = require("plugins.lovelibs.CameraMgr.lib.CameraMgr")
-- CM = require("plugins.lovelibs.CameraMgr.lib.CameraMgr").newManager()
-- CM=Camera.newManager()
-- BK=Camera.newManager()

local editgrid = require("plugins.Editgrid.editgrid")
local visuals = {
    -- size = 100,
    -- subdivisions = 5,
    -- color = {128, 140, 250},
    -- drawScale = false,
    -- xColor = {255, 255, 0},
    -- yColor = {0, 255, 255},
    -- fadeFactor = 0.3,
    -- textFadeFactor = 0.5,
    -- hideOrigin = true,
    interval = 50
}

-- local camera = {
--     x = 20,
--     y = 20,
--     zoom = 2,
--     angle = math.pi/2,
--     sx = 5,
--     sy = 5,
--     sw = love.graphics.getWidth() - 10,
--     sh = love.graphics.getHeight() - 10
-- }


function love.load()

    -- fs=love.window.setFullscreen(true,"desktop")

    width, height = love.graphics.getDimensions()
    size = (width<height) and width or height

    bkg=love.graphics.newImage("assets/img/bk_red01.jpg")
    image=love.graphics.newImage("assets/img/img_rosarioSaoMiguel.png")
    quad = love.graphics.newQuad(0, 0, size, size, size, size)
    quad1 = love.graphics.newQuad(0, 0, width, height, width, height)

    -- CM.setCoords(size/2, size/2)
    -- BK.setOffset(20)
    -- CM.setTarget(size/2, size/2)
    -- BK.setTarget(size/2, size/2)

    s=1
    r=0
    l=0

    -- map = Sti("assets/map/mapa.lua")

end

function love.update(dt)
    -- CM.update(dt)
    -- BK.update(dt)
    s=s+0.001
    r=r+0.01
    l=l+0.01
end

function love.draw()
    -- CM.setScale(s)
    -- CM.setRotation(r)
    
    -- BK.setRotation(r)
    -- CM.setLerp(l)
    -- CM.setLerp(l)

    -- BK.attach()
    --     love.graphics.draw(bkg, quad1, 0, 0)
    -- BK.detach()

    -- CM.attach()
        -- map:draw()
    camera:setAngle(r)

    camera:draw(function(l,t,w,h)
        love.graphics.draw(bkg, quad1, 0, 0)
        love.graphics.draw(image, quad, (width/2-size/2), (height/2-size/2))
        -- love.graphics.draw(image, quad, 0, 0)
    end)
    -- CM.detach()
    -- CM.debug()
    
    -- editgrid.draw(CM, visuals)
    -- editgrid.draw(camera, visuals)
end

function love.keyreleased(key)
    if key == "f11" then
        fullscreen = not fullscreen
        love.window.setFullscreen(fullscreen, "exclusive")
    end
    if key=="escape" then
        love.event.quit()
    end
end
