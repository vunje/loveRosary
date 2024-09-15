Camera = require("plugins.lovelibs.CameraMgr.lib.CameraMgr")
-- CM = require("plugins.lovelibs.CameraMgr.lib.CameraMgr").newManager()
CM=Camera.newManager()

function love.load()
    -- local Position=component.create("position",{"x","y"},{x=0,y=0})

    -- fs=love.window.setFullscreen(true,"desktop")

    width, height = love.graphics.getDimensions()
    size = (width<height) and width or height

    image=love.graphics.newImage("assets/img/fpgJx.jpg")
    quad = love.graphics.newQuad(0, 0, size, size, size, size)

    -- CM.setCoords(size/2, size/2)
    CM.setTarget(size/2, size/2)

    s=1
    r=0
    l=0
end

function love.update(dt)
    CM.update(dt)
    s=s+0.001
    r=r+0.01
    l=l+0.01
end

function love.draw()
    -- CM.setScale(s)
    -- CM.setRotation(r)
    -- CM.setLerp(l)
    CM.attach()
        -- love.graphics.draw(image, quad, (width/2-size/2), (height/2-size/2))
        love.graphics.draw(image, quad, 0, 0)
    CM.detach()
    CM.debug()
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
