------------------------------------------------------------------------------------------------
--Hi! Just so you know, if you're here to pirate all this, I can't really do much to stop you.--
--If you are, just know that all of us developers think you're an asshole. Have a good day!   --
------------------------------------------------------------------------------------------------
function love.load()
	dofile("Game\\Save\\load.lua")
	--# WINDOW #--
	love.window.setTitle("Cortez")
	love.window.setMode(600,600)
	--# VARIABLES #--
	winX,winY=love.window.getDesktopDimensions()
	winY=winY-100
	ratio=1
	printing=false
	printingText={}
	screenText=0
	allowOpen=true
	allowClose=false
	canMenu=true
	canMove=true
	--# FILE MANAGEMENT #--
	resizeLarge=assert(loadfile("Game\\Resize\\resizeLarge.lua"))
	resizeSmall=assert(loadfile("Game\\Resize\\resizeSmall.lua"))
	dofile("Game\\Text\\loadText.lua")
	doText=assert(loadfile("Game\\Text\\doText.lua"))
	printText=assert(loadfile("Game\\Text\\printText.lua"))
	openMenu=assert(loadfile("Game\\Menu\\menu.lua"))
	saveFile=assert(loadfile("Game\\Save\\save.lua"))
	dofile("Game\\Sound\\loadSound.lua")
	volControl=assert(loadfile("Game\\Sound\\volControl.lua"))
	--# FUNCTIONS #--
	function newRectangle(x,y,l,h)
		love.graphics.rectangle("fill",x*ratio,y*ratio,l*ratio,h*ratio)
	end
	function resetOptions()
		opt1Sel=true
		opt2Sel=false
		opt3Sel=false
		opt4Sel=false
		opt5Sel=false
	end
	function playSound(src)
		playTable={}
		if src:isPlaying() == true then
			table.insert(playTable,src:clone())
			for i,v in ipairs(playTable) do
				if playTable[i+1] == nil then
					v:play()
				end
				table.remove(playTable,i)
			end
		else
			src:play()
		end
	end
	function text(engContent,spaContent,nahContent,engX,engY,engSize,spaX,spaY,spaSize,nahX,nahY,nahSize)

		local firstChar=true
		local selected=false
		local countdown=0
		local cat=""
		screenText=screenText+1

		if language == "Eng" then
			processText={engX,engY,engSize}
			for ch in string.gmatch(engContent,".") do
				local isColon=false
				if firstChar == true and ch == ":" then
					selected=true
					isColon=true
				end
				if ch == "{" then
					countdown=3
				end
					if countdown == 0 then
					if selected == true and isColon == false then
						table.insert(processText,("Sel" .. ch))
					elseif selected == false and isColon == false then
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
		end
		if language == "Spa" then
			processText={spaX,spaY,spaSize}
			for ch in string.gmatch(spaContent,".") do
				local isColon=false
				if firstChar == true and ch == ":" then
					selected=true
					isColon=true
				end
				if ch == "{" then
					countdown=3
				end
					if countdown == 0 then
					if selected == true and isColon == false then
						table.insert(processText,("Sel" .. ch))
					elseif selected == false and isColon == false then
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
		end
		if language == "Nah" then
			processText={nahX,nahY,nahSize}
			for ch in string.gmatch(nahContent,".") do
				local isColon=false
				if firstChar == true and ch == ":" then
					selected=true
					isColon=true
				end
				if ch == "{" then
					countdown=3
				end
				if countdown == 0 then
					if selected == true and isColon == false then
						table.insert(processText,("Sel" .. ch))
					elseif selected == false and isColon == false then
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
		end
		doText()
		printing=true
	end
	function resetText()
		printing=false
		screenText=0
		printingText={}
	end
	--# LOAD IFS #--
	if large == true then
		resizeLarge()
	end
end

function love.update(dt)
	volControl()
	--# CONTROLS #--
	if canMove == true then
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
	end
	local eCheck=love.keyboard.isDown("e")
	local escCheck=love.keyboard.isDown("escape")
	if eCheck == true and allowOpen == true and canMenu == true then
		playSound(menuBlipSFX)
		menu=true
		allowOpen=false
		canMove=false
		menuSection="main"
		resetOptions()
		canAdvance=false
	end
	if menu == true and eCheck == false then
		allowClose=true
	end
	if escCheck == true and allowClose == true and menuSection == "main" and canAdvance == true then
		playSound(menuBlipSFX)
		menu=false
		allowClose=false
		resetText()
		canMove=true
	end
	if menu == false and escCheck == false then
		allowOpen=true
	end
end

function love.draw() -- DEFAULT SCREEN DIMENSIONS: 600 by 600
	love.graphics.setColor(0,255,0)
	newRectangle(0,0,600,600)
	--# CHARACTER #--
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",x,y,50*ratio,50*ratio)
	--# TEXT #--
	--DEBUG text("ABCDEFGHIJKLMN","","",10,10,0.5,0,0,0,0,0,0)
	--DEBUG text("NOPQRSTUVWXYZ","","",10,60,0.5,0,0,0,0,0,0)
	--DEBUG text("abcdefghijklmn","","",10,110,0.5,0,0,0,0,0,0)
	--DEBUG text("nopqrstuvwxyz","","",10,160,0.5,0,0,0,0,0,0)
	--DEBUG text("{1a{1i{1u{1e{1o{1!!{1??:.{1A{1I{1U{1E{1O","","",10,210,0.5,0,0,0,0,0,0)
	--DEBUG text("{2a{2i{2e{2o{2A{2I{2E{2O","","",10,260,0.5,0,0,0,0,0,0)
	if menu == true then
		resetText()
		openMenu()
	end
	if printing == true then
		printText()
	end
	resetText()
end
