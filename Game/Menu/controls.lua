local upPressed=love.keyboard.isDown(upControl)
local downPressed=love.keyboard.isDown(downControl)
local leftPressed=love.keyboard.isDown(leftControl)
local rightPressed=love.keyboard.isDown(rightControl)
local ePressed=love.keyboard.isDown(eControl)
local escPressed=love.keyboard.isDown(escControl)
local checkKeyDown=assert(loadfile("Game\\Menu\\checkKeyDown.lua"))

if setTempControls == true then
	selecting=false
	setTempControls=false
	tempRightControl=rightControl
	tempLeftControl=leftControl
	tempUpControl=upControl
	tempDownControl=downControl
end

text("Movement Controls","Controles De Movimiento","NAH",60,60,0.6,60,60,0.4,60,60,0.5)

if escPressed == true and canAdvance == true and selecting == false then
	canAdvance=false
	playSound(menuBlipSFX)
	menuSection="options"
	resetOptions()
end

if opt1Sel == true and downPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt1Sel=false
	opt2Sel=true
end
if opt1Sel == true and ePressed == true and canAdvance == true then
	tempRightControl="[Assign Key]"
	selecting=true
	canAdvance=false
end
if opt1Sel == true and selecting == true then
	if checkKeyDown() ~= nil then
		tempRightControl=checkKeyDown()
		rightControl=checkKeyDown()
		selecting=false
	end
end
if opt1Sel == true and selecting == true and escPressed == true then
	tempRightControl=rightControl
	selecting=false
end
if opt2Sel == true and downPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt2Sel=false
	opt3Sel=true
end
if opt2Sel == true and upPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt2Sel=false
	opt1Sel=true
end
if opt2Sel == true and ePressed == true and canAdvance == true then
	tempLeftControl="[Assign Key]"
	selecting=true
	canAdvance=false
end
if opt2Sel == true and selecting == true then
	if checkKeyDown() ~= nil then
		tempLeftControl=checkKeyDown()
		leftControl=checkKeyDown()
		selecting=false
	end
end
if opt2Sel == true and selecting == true and escPressed == true then
	tempLeftControl=leftControl
	selecting=false
end
if opt3Sel == true and downPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt3Sel=false
	opt4Sel=true
end
if opt3Sel == true and upPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt3Sel=false
	opt2Sel=true
end
if opt3Sel == true and ePressed == true and canAdvance == true then
	tempUpControl="[Assign Key]"
	selecting=true
	canAdvance=false
end
if opt3Sel == true and selecting == true then
	if checkKeyDown() ~= nil then
		tempUpControl=checkKeyDown()
		upControl=checkKeyDown()
		selecting=false
	end
end
if opt3Sel == true and selecting == true and escPressed == true then
	tempUpControl=upControl
	selecting=false
end
if opt4Sel == true and upPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt4Sel=false
	opt3Sel=true
end
if opt4Sel == true and ePressed == true and canAdvance == true then
	tempDownControl="[Assign Key]"
	selecting=true
	canAdvance=false
end
if opt4Sel == true and selecting == true then
	if checkKeyDown() ~= nil then
		tempDownControl=checkKeyDown()
		downControl=checkKeyDown()
		selecting=false
	end
end
if opt4Sel == true and selecting == true and escPressed == true then
	tempDownControl=downControl
	selecting=false
end

option(opt1Sel,"Move Right","SPA","NAH",60,120,0.3,60,120,0.3,60,120,0.3)
text(tempRightControl,tempRightControl,tempRightControl,300,120,0.3,300,120,0.3,300,120,0.3)
option(opt2Sel,"Move Left","SPA","NAH",60,150,0.3,60,150,0.3,60,150,0.3)
text(tempLeftControl,tempLeftControl,tempLeftControl,300,150,0.3,300,150,0.3,300,150,0.3)
option(opt3Sel,"Move Up","SPA","NAH",60,180,0.3,60,180,0.3,60,180,0.3)
text(tempUpControl,tempUpControl,tempUpControl,300,180,0.3,300,180,0.3,300,180,0.3)
option(opt4Sel,"Move Down","SPA","NAH",60,210,0.3,60,210,0.3,60,210,0.3)
text(tempDownControl,tempDownControl,tempDownControl,300,210,0.3,300,210,0.3,300,210,0.3)
