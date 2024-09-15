function love.load()
    -- local Position=component.create("position",{"x","y"},{x=0,y=0})

    width, height = love.graphics.getDimensions()
    size = (width<height) and width or height

    image=love.graphics.newImage("assets/img/fpgJx.jpg")
    quad = love.graphics.newQuad(0, 0, size, size, size, size)
end

function love.draw()
    love.graphics.draw(image, quad, (width/2-size/2), (height/2-size/2))
end

function love.keyreleased(key)
    if key=="escape" then
        love.event.quit()
    end
end
