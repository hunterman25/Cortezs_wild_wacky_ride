function love.load()
	love.window.setMode(600,600)
	x=300
	y=300
	speed=1
end
function love.update(dt)
	if love.keyboard.isDown("1") then
		speed=1
	end
	if love.keyboard.isDown("2") then
		speed=5
	end
	if love.keyboard.isDown("3") then
		speed=10
	end
	if love.keyboard.isDown("up") then
		y=y-speed
	end
	if love.keyboard.isDown("left") then
		x=x-speed
	end
	if love.keyboard.isDown("down") then
		y=y+speed
	end
	if love.keyboard.isDown("right") then
		x=x+speed
	end
end
function love.draw()
	love.graphics.print(("X: " .. x .. "\nY: " .. y),10,10,0,2)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",x,y,5,5)
end