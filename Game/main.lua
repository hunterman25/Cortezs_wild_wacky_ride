function love.load()
	--# WINDOW #--
	love.window.setTitle("Fuck Spain")
	love.window.setMode(600,600)
	--# VARIABLES #--
	winX,winY=love.window.getDesktopDimensions()
	winY=winY-100
	ratio=1
	large=false
	x=275
	y=275
	printing=false
	printingText={}
	screenText=0
	--# FILE MANAGEMENT #--
	resizeLarge=assert(loadfile("Game\\Resize\\resizeLarge.lua"))
	resizeSmall=assert(loadfile("Game\\Resize\\resizeSmall.lua"))
	dofile("Game\\Text\\loadText.lua")
	doText=assert(loadfile("Game\\Text\\doText.lua"))
	printText=assert(loadfile("Game\\Text\\printText.lua"))
	--# FUNCTIONS #--
	function newRectangle(x,y,l,h)
		love.graphics.rectangle("fill",x*ratio,y*ratio,l*ratio,h*ratio)
	end
	function text(content,x,y,size)
		screenText=screenText+1
		processText={x,y,size}
		for ch in string.gmatch(content,".") do
			table.insert(processText,ch)
		end
		doText()
		printing=true
	end
	function resetText()
		printing=false
		screenText=0
		printingText={}
	end
end

function love.update(dt)
	if love.keyboard.isDown("f") and large~=true then
		resizeLarge()
		large=true
	end
	if love.keyboard.isDown("s") and large==true then
		resizeSmall()
		large=false
	end
	if love.keyboard.isDown("left") and x > 0 then
		x=x-5*ratio
	end
	if love.keyboard.isDown("right") and x+50*ratio < 600*ratio then
		x=x+5*ratio
	end
	if love.keyboard.isDown("up") and y > 0 then
		y=y-5*ratio
	end
	if love.keyboard.isDown("down") and y+50*ratio < 600*ratio then
		y=y+5*ratio
	end
	if love.keyboard.isDown("g") then
		text("hey",100,100,1.5)
	end
	if love.keyboard.isDown("h") then
		text("Á Ññ It works :)",100,200,1)
	end
	if love.keyboard.isDown("j") then
		resetText()
	end
end

function love.draw() -- DEFAULT SCREEN DIMENSIONS: 600 by 600
	love.graphics.setColor(0,255,0)
	newRectangle(0,0,600,600)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",x,y,50*ratio,50*ratio)

	--# TEXT #--
	if printing == true then
		printText()
	end
end
