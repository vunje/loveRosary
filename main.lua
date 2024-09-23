-- Sti= require("plugins.Simple-Tiled-Implementation.sti")

local Cupid = require("plugins.cupid-git.cupid")

local Gamera = require("plugins.gamera.gamera")
local camera = Gamera.new(0,0,800,600) 
-- Camera = require("plugins.lovelibs.CameraMgr.lib.CameraMgr")
-- CM = require("plugins.lovelibs.CameraMgr.lib.CameraMgr").newManager()
-- CM=Camera.newManager()
-- BK=Camera.newManager()

local Baton = require("plugins.baton.baton")
local input = Baton.new {
    controls = {
        left = {'key:left', 'key:a', 'axis:leftx-', 'button:dpleft'},
        right = {'key:right', 'key:d', 'axis:leftx+', 'button:dpright'},
        up = {'key:up', 'key:w', 'axis:lefty-', 'button:dpup'},
        down = {'key:down', 'key:s', 'axis:lefty+', 'button:dpdown'},
        action = {'key:x', 'button:a'},
    },
    pairs = {
        move = {'left', 'right', 'up', 'down'}
    },
    joystick = love.joystick.getJoysticks()[1],
}


local editgrid = require("plugins.Editgrid.editgrid")

local visuals = {
    -- size = 100,
    subdivisions = 3,
    -- color = {128, 140, 250},
    drawScale = true,
    xColor = {255, 255, 0},
    yColor = {0, 255, 255},
    fadeFactor = 0.3,
    -- textFadeFactor = 0.5,
    hideOrigin = false,
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
    image=love.graphics.newImage("assets/img/img_rosarioSaoMiguelHigh.png")
    sombra=love.graphics.newImage("assets/img/img_rosarioSaoMiguelSombra.png");
    crosshair=love.graphics.newImage("assets/img/img_crosshair2.png")

    quad = love.graphics.newQuad(0, 0, size, size, size, size)
    quad2 = love.graphics.newQuad(-10,-10, size, size, size, size)
    quad1 = love.graphics.newQuad(0, 0, width, height, width, height)
    q_crosshair = love.graphics.newQuad(0, 0, 15, 15, 15, 15)

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
    input:update()
    -- camera:setAngle(r)
    s=s+0.001
    r=r+0.01
    l=l+0.01
end

function love.draw()

    camera:draw(function(l,t,w,h)
        -- map:draw()
        love.graphics.draw(bkg, quad1, 0, 0)
        love.graphics.draw(sombra, quad2, (width/2-size/2), (height/2-size/2))
        love.graphics.draw(image, quad, (width/2-size/2), (height/2-size/2))
        love.graphics.draw(crosshair, q_crosshair, 0, 0)
    end)
    editgrid.draw(camera, visuals)
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
