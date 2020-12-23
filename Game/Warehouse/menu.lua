love.graphics.setColor(255,255,255,0.5)
newRectangle(50,50,500,500)
local function option(optIndex,engDisplay,spaDisplay,nahDisplay,engX,engY,engSize,spaX,spaY,spaSize,nahX,nahY,nahSize)
	if optIndex == true then
		text((":" .. engDisplay),(":" .. spaDisplay),(":" .. nahDisplay),engX,engY,engSize,spaX,spaY,spaSize,nahX,nahY,nahSize)
	end
	if optIndex == false then
		text(engDisplay,spaDisplay,nahDisplay,engX,engY,engSize,spaX,spaY,spaSize,nahX,nahY,nahSize)
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
		opt5Sel=true
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
	option(opt1Sel,"Inventory","Inventario","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt2Sel,"PlayerName","PlayerName","PlayerName",60,120,0.5,60,120,0.5,60,120,0.5)
	option(opt3Sel,"Save","Salvar","NAH",60,180,0.5,60,180,0.5,60,180,0.5)
	option(opt4Sel,"Options","Opciones","NAH",60,240,0.5,60,240,0.5,60,240,0.5)
	option(opt5Sel,"Quit","SPA","NAH",60,300,0.5,60,300,0.5,60,300,0.5)
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
	option(opt1Sel,"Yes","Si","NAH",50,300,1.5,100,300,1.5,50,300,1.5)
	option(opt2Sel,"No","No","NAH",350,300,1.5,350,300,1.5,350,300,1.5)
	text("Save?","{1?Salvar?","NAH",100,150,1.5,100,150,1,100,150,1.5)
end
if menuSection == "saving" and saving == true then
	text("Saving...","Salvando...","NAH",100,200,1,100,200,0.75,100,200,1)
	--TEMP
	if love.keyboard.isDown("right") and canAdvance == true then
		canAdvance=false
		saveFile()
	end
	--TEMP
end
if menuSection == "saving" and saving == false then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	if ePressed == true and canAdvance == true then
		canAdvance=false
		menuSection="main"
		resetOptions()
	end
	text("Save","SPA","NAH",130,100,1.5,130,100,1.5,130,100,1.5)
	text("Complete.","SPA","NAH",90,250,1,90,250,1,90,250,1)
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
	option(opt1Sel,"Controls","SPA","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt2Sel,"Audio","SPA","NAH",60,120,0.5,60,120,0.5,60,120,0.5)
	option(opt3Sel,"Video","Video","NAH",60,180,0.5,60,180,0.5,60,180,0.5)
	option(opt4Sel,"Other","SPA","NAH",60,240,0.5,60,240,0.5,60,240,0.5)
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
	option(opt1Sel,"No","No","NAH",70,300,1.5,70,300,1.5,70,300,1.5)
	option(opt2Sel,"Yes","Si","NAH",300,300,1.5,300,300,1.5,300,300,1.5)
	text("Are you","SPA","NAH",120,100,1,120,100,1,120,100,1)
	text("sure?","SPA","NAH",160,170,1,160,170,1,160,170,1)
end

--# OPTIONS SECTIONS #--

if menuSection == "video" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		menuSection="options"
		resetOptions()
	end
	if large == false then
		text("Small","Chico","NAH",360,60,0.5,360,100,0.5,360,60,0.5)
		if rightPressed == true or leftPressed == true then
			if canAdvance == true then
				resizeLarge()
				large=true
				canAdvance=false
			end
		end
	else
		text("Large","Grande","NAH",360,60,0.5,360,100,0.5,360,60,0.5)
		if rightPressed == true or leftPressed == true then
			if canAdvance == true then
				resizeSmall()
				large=false
				canAdvance=false
			end
		end
	end
	option(opt1Sel,"Screen Size:","Tama{1no De","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt1Sel,"","Pantalla:","",0,0,0,60,100,0.5,0,0,0)
end
