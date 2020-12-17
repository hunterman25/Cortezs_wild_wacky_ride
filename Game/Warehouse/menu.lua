love.graphics.setColor(255,255,255,0.5)
newRectangle(50,50,500,500)
local function option(optIndex,display,x,y,size)
	if optIndex == true then
		text((":" .. display),x,y,size)
	end
	if optIndex == false then
		text(display,x,y,size)
	end
end
local upPressed=love.keyboard.isDown("up")
local downPressed=love.keyboard.isDown("down")
local leftPressed=love.keyboard.isDown("left")
local rightPressed=love.keyboard.isDown("right")
local ePressed=love.keyboard.isDown("e")
local escPressed=love.keyboard.isDown("escape")
if downPressed == false and upPressed == false and leftPressed == false and rightPressed == false and ePressed == false and escPressed == false then
	canAdvance=true
end
if menuSection == "main" then
	if opt1Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=false
		opt2Sel=true
	end
	if opt1Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=false
		opt4Sel=true
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="inventory"
		resetOptions()
	end
	if opt2Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=false
		opt3Sel=true
	end
	if opt2Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=false
		opt1Sel=true
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="player"
		resetOptions()
	end
	if opt3Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt3Sel=false
		opt4Sel=true
	end
	if opt3Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt3Sel=false
		opt2Sel=true
	end
	if opt3Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="save"
		resetOptions()
	end
	if opt4Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt4Sel=false
		opt5Sel=true
	end
	if opt4Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt4Sel=false
		opt3Sel=true
	end
	if opt4Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="options"
		resetOptions()
	end
	if opt5Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt5Sel=false
		opt1Sel=true
	end
	if opt5Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt5Sel=false
		opt4Sel=true
	end
	if opt5Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="quit"
		resetOptions()
	end
	love.graphics.setColor(255,255,255)
	option(opt1Sel,"Inventory",60,60,0.5)
	option(opt2Sel,"PlayerName",60,120,0.5)
	option(opt3Sel,"Save",60,180,0.5)
	option(opt4Sel,"Options",60,240,0.5)
	option(opt5Sel,"Quit",60,300,0.5)
end

--# MAIN SECTIONS #--

if menuSection == "save" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="saving"
		resetOptions()
		saving=true
	end
	if opt2Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	option(opt1Sel,"Yes",50,300,1.5)
	option(opt2Sel,"No",350,300,1.5)
	text("Save?",100,150,1.5)
end
if menuSection == "saving" and saving == true then
	text("Saving...",100,200,1)
	saveFile()
end
if menuSection == "saving" and saving == false then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	text("Save",130,100,1.5)
	text("Complete.",90,250,1)
end
if menuSection == "options" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=false
		opt2Sel=true
	end
	if opt1Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=false
		opt4Sel=true
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="controls"
		resetOptions()
	end
	if opt2Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=false
		opt3Sel=true
	end
	if opt2Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=false
		opt1Sel=true
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="audio"
		resetOptions()
	end
	if opt3Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt3Sel=false
		opt4Sel=true
	end
	if opt3Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt3Sel=false
		opt2Sel=true
	end
	if opt3Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="video"
		resetOptions()
	end
	if opt4Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		opt4Sel=false
		opt1Sel=true
	end
	if opt4Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt4Sel=false
		opt3Sel=true
	end
	if opt4Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="other"
		resetOptions()
	end
	option(opt1Sel,"Controls",60,60,0.5)
	option(opt2Sel,"Audio",60,120,0.5)
	option(opt3Sel,"Video",60,180,0.5)
	option(opt4Sel,"Other",60,240,0.5)
end
if menuSection == "quit" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	if opt2Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		os.exit()
	end
	option(opt1Sel,"No",70,300,1.5)
	option(opt2Sel,"Yes",300,300,1.5)
	text("Are you",120,100,1)
	text("sure?",160,170,1)
end

--# OPTIONS SECTIONS #--

if menuSection == "video" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="options"
		resetOptions()
	end
	if large == false then
		text("Small",360,60,0.5)
		if rightPressed == true or leftPressed == true then
			if canAdvance == true then
				resizeLarge()
				large=true
				canAdvance=false
			end
		end
	else
		text("Large",360,60,0.5)
		if rightPressed == true or leftPressed == true then
			if canAdvance == true then
				resizeSmall()
				large=false
				canAdvance=false
			end
		end
	end
	option(opt1Sel,"Screen Size:",60,60,0.5)
end
