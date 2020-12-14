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
		opt1Sel=true
	end
	if opt4Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		opt4Sel=false
		opt3Sel=true
	end
	if opt4Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="quit"
		resetOptions()
	end
	love.graphics.setColor(255,255,255)
	option(opt1Sel,"Inventory",60,60,0.5)
	option(opt2Sel,"PlayerName",60,120,0.5)
	option(opt3Sel,"Save",60,180,0.5)
	option(opt4Sel,"Quit",60,240,0.5)
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
	text("sure?",200,160,1)
end
