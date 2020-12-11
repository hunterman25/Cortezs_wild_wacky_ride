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
	allowOpen=true
	allowClose=false
	--# FILE MANAGEMENT #--
	resizeLarge=assert(loadfile("Game\\Resize\\resizeLarge.lua"))
	resizeSmall=assert(loadfile("Game\\Resize\\resizeSmall.lua"))
	dofile("Game\\Text\\loadText.lua")
	doText=assert(loadfile("Game\\Text\\doText.lua"))
	printText=assert(loadfile("Game\\Text\\printText.lua"))
	openMenu=assert(loadfile("Game\\Warehouse\\menu.lua"))
	--# FUNCTIONS #--
	function newRectangle(x,y,l,h)
		love.graphics.rectangle("fill",x*ratio,y*ratio,l*ratio,h*ratio)
	end
	function text(content,x,y,size)

		local firstChar=true
		local selected=false
		local countdown=0
		local cat=""
		screenText=screenText+1
		processText={x,y,size}

		for ch in string.gmatch(content,".") do
			if firstChar == true and ch == ":" then
				selected=true
			end
			if ch == "{" then
				countdown=3
			end
			if countdown == 0 then
				if selected == true then
					table.insert(processText,("Sel" .. ch))
				else
					table.insert(processText,ch)
				end
			else
				if countdown == 2 then
					local compare=tonumber(ch)
					if compare ~= nil then
						if compare == 1 then
							cat="Spa"
						elseif compare == 2 then
							cat="Nah"
						end
					end
				end
				if countdown == 1 then
					if selected == true then
						table.insert(processText,("Sel" .. cat .. ch))
					else
						table.insert(processText,(cat .. ch))
					end
				end
				countdown=countdown-1
			end
			if firstChar == true and ch == ":" then
				selected=true
			end
			firstChar=false
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
	--CONTROLS--
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
		text(":A{1a{2a {1N{1n It works :)",100,200,1)
	end
	if love.keyboard.isDown("j") then
		resetText()
	end
	local menuCheck=love.keyboard.isDown("e")
	if menuCheck == true and allowOpen == true then
		menu=true
		allowOpen=false
	end
	if menu == true and menuCheck == false then
		allowClose=true
	end
	if menuCheck == true and allowClose == true then
		menu=false
		allowClose=false
	end
	if menu == false and menuCheck == false then
		allowOpen=true
	end
end

function love.draw() -- DEFAULT SCREEN DIMENSIONS: 600 by 600
	love.graphics.setColor(0,255,0)
	newRectangle(0,0,600,600)
	if menu == true then
		openMenu()
	end
	--# CHARACTER #--
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",x,y,50*ratio,50*ratio)
	--# TEXT #--
	if printing == true then
		printText()
	end
end
