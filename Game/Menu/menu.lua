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
local inventoryFile=assert(loadfile("Game\\Menu\\inventory.lua"))
if downPressed == false and upPressed == false and leftPressed == false and rightPressed == false and ePressed == false and escPressed == false then
	canAdvance=true
	countdown=8
end
if menuSection == "main" then
	if opt1Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=false
		opt2Sel=true
	end
	if opt1Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=false
		opt5Sel=true
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="inventory"
		resetOptions()
	end
	if opt2Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=false
		opt3Sel=true
	end
	if opt2Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=false
		opt1Sel=true
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="player"
		resetOptions()
	end
	if opt3Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=false
		opt4Sel=true
	end
	if opt3Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=false
		opt2Sel=true
	end
	if opt3Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="save"
		resetOptions()
	end
	if opt4Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt4Sel=false
		opt5Sel=true
	end
	if opt4Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt4Sel=false
		opt3Sel=true
	end
	if opt4Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="options"
		resetOptions()
	end
	if opt5Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt5Sel=false
		opt1Sel=true
	end
	if opt5Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt5Sel=false
		opt4Sel=true
	end
	if opt5Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="quit"
		resetOptions()
	end
	love.graphics.setColor(255,255,255)
	option(opt1Sel,"Inventory","Inventario","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt2Sel,"PlayerName","PlayerName","PlayerName",60,120,0.5,60,120,0.5,60,120,0.5)
	option(opt3Sel,"Save","Guardar","NAH",60,180,0.5,60,180,0.5,60,180,0.5)
	option(opt4Sel,"Options","Opciones","NAH",60,240,0.5,60,240,0.5,60,240,0.5)
	option(opt5Sel,"Quit","Abandonar","NAH",60,300,0.5,60,300,0.5,60,300,0.5)
end

--# MAIN SECTIONS #--

if menuSection == "inventory" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	inventoryFile()
end
if menuSection == "save" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="saving"
		resetOptions()
		saving=true
	end
	if opt2Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	option(opt1Sel,"Yes","Si","NAH",50,300,1.5,100,300,1.5,50,300,1.5)
	option(opt2Sel,"No","No","NAH",350,300,1.5,320,300,1.5,350,300,1.5)
	text("Save?","{1?Guardar?","NAH",100,150,1.5,75,150,1,100,150,1.5)
end
if menuSection == "saving" and saving == true then
	text("Saving...","Guardando...","NAH",100,200,1,100,200,0.75,100,200,1)
	saveFile()
end
if menuSection == "saving" and saving == false then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	if ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	text("Save","Guardar","NAH",130,100,1.5,120,150,1,130,100,1.5)
	text("Complete.","Completo.","NAH",90,250,1,90,250,1,90,250,1)
end
if menuSection == "options" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=false
		opt2Sel=true
	end
	if opt1Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=false
		opt4Sel=true
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="controls"
		resetOptions()
	end
	if opt2Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=false
		opt3Sel=true
	end
	if opt2Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=false
		opt1Sel=true
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="audio"
		resetOptions()
	end
	if opt3Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=false
		opt4Sel=true
	end
	if opt3Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=false
		opt2Sel=true
	end
	if opt3Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="video"
		resetOptions()
	end
	if opt4Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)	
		opt4Sel=false
		opt1Sel=true
	end
	if opt4Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt4Sel=false
		opt3Sel=true
	end
	if opt4Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="other"
		resetOptions()
	end
	option(opt1Sel,"Controls","Controles","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt2Sel,"Audio","Sonido","NAH",60,120,0.5,60,120,0.5,60,120,0.5)
	option(opt3Sel,"Video","Video","NAH",60,180,0.5,60,180,0.5,60,180,0.5)
	option(opt4Sel,"Other","M{1as Opciones","NAH",60,240,0.5,60,240,0.5,60,240,0.5)
end
if menuSection == "quit" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	if opt1Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="main"
		resetOptions()
	end
	if opt2Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and ePressed == true and canAdvance == true then
		playSound(menuBlipSFX)
		os.exit()
	end
	option(opt1Sel,"No","No","NAH",70,300,1.5,100,300,1.5,70,300,1.5)
	option(opt2Sel,"Yes","Si","NAH",300,300,1.5,350,300,1.5,300,300,1.5)
	text("Are you","{1?Est{1as","NAH",120,100,1,120,100,1,120,100,1)
	text("sure?","seguro?","NAH",160,170,1,110,170,1,160,170,1)
end

--# OPTIONS SECTIONS #--

if menuSection == "audio" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="options"
		resetOptions()
	end
	if opt1Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt1Sel=false
	end
	if opt1Sel == true and rightPressed == true and masterVol < 100 then
		if countdown == 8 then
			masterVol=masterVol+1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	if opt1Sel == true and leftPressed == true and masterVol > 0 then
		if countdown == 8 then
			masterVol=masterVol-1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	if opt2Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=true
		opt2Sel=false
	end
	if opt2Sel == true and rightPressed == true and musicVol < 100 then
		if countdown == 8 then
			musicVol=musicVol+1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	if opt2Sel == true and leftPressed == true and musicVol > 0 then
		if countdown == 8 then
			musicVol=musicVol-1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	if opt3Sel == true and upPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt3Sel=false
	end
	if opt3Sel == true and downPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt1Sel=true
		opt3Sel=false
	end
	if opt3Sel == true and rightPressed == true and soundVol < 100 then
		if countdown == 8 then
			soundVol=soundVol+1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	if opt3Sel == true and leftPressed == true and soundVol > 0 then
		if countdown == 8 then
			soundVol=soundVol-1
			countdown=countdown-1
		elseif countdown < 8 and countdown > 0 then
			countdown=countdown-1
		elseif countdown == 0 then
			countdown=8
		end
	end
	option(opt1Sel,"Master Volume:","Volume:","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt2Sel,"Music Volume:","M{1usica:","NAH",60,120,0.5,60,120,0.5,60,120,0.5)
	option(opt3Sel,"Sound Volume:","Efectos:","NAH",60,180,0.5,60,180,0.5,60,180,0.5)	
	text(masterVol,masterVol,masterVol,450,60,0.5,450,60,0.5,450,60,0.5)
	text(musicVol,musicVol,musicVol,450,120,0.5,450,120,0.5,450,120,0.5)
	text(soundVol,soundVol,soundVol,450,180,0.5,450,180,0.5,450,180,0.5)
end
if menuSection == "video" then
	if escPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
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
				playSound(menuSelectSFX)
			end
		end
	else
		text("Large","Grande","NAH",360,60,0.5,360,100,0.5,360,60,0.5)
		if rightPressed == true or leftPressed == true then
			if canAdvance == true then
				resizeSmall()
				large=false
				canAdvance=false
				playSound(menuSelectSFX)
			end
		end
	end
	option(opt1Sel,"Screen Size:","Tama{1no De","NAH",60,60,0.5,60,60,0.5,60,60,0.5)
	option(opt1Sel,"","Pantalla:","",0,0,0,60,100,0.5,0,0,0)
end
if menuSection == "other" then
	if escPressed == true and canAdvance == true and opt2Sel ~= true and opt3Sel ~= true and opt4Sel ~= true then
		canAdvance=false
		playSound(menuBlipSFX)
		menuSection="options"
		resetOptions()
	end
	if opt1Sel == true and ePressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuBlipSFX)
		if language == "Eng" then
			opt2Sel=true
		elseif language == "Spa" then
			opt3Sel=true
		elseif language == "Nah" then
			opt4Sel=true
		end
		opt1Sel=false
	end
	if opt2Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt4Sel=true
		opt2Sel=false
		--language="Nah"
	end
	if opt2Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=true
		opt2Sel=false
		language="Spa"
	end
	if opt3Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt3Sel=false
		language="Eng"
	end
	if opt3Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt4Sel=true
		opt3Sel=false
		--language="Nah"
	end
	if opt4Sel == true and leftPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt3Sel=true
		opt4Sel=false
		language="Spa"
	end
	if opt4Sel == true and rightPressed == true and canAdvance == true then
		canAdvance=false
		playSound(menuSelectSFX)
		opt2Sel=true
		opt4Sel=false
		language="Eng"
	end
	if opt2Sel == true or opt3Sel == true or opt4Sel == true then
		if ePressed == true and canAdvance == true then
			canAdvance=false
			playSound(menuBlipSFX)
			resetOptions()
			opt1Sel=true
		end
		if escPressed == true and canAdvance == true then
			canAdvance=false
			playSound(menuBlipSFX)
			resetOptions()
			opt1Sel=true
		end
	end
	option(opt1Sel,"Language","Lenguajes","NAH",190,60,0.5,180,60,0.5,180,60,0.5)
	option(opt2Sel,"English","Ingl{1es","NAH",70,100,0.4,70,100,0.4,70,100,0.4)
	option(opt3Sel,"Spanish","Espa{1nol","NAH",230,100,0.4,230,100,0.4,230,100,0.4)
	option(opt4Sel,"Nahuatl","N{1ahuatl","N{2ahuatlaht{2olli",400,100,0.4,400,100,0.4,400,100,0.4)
end
