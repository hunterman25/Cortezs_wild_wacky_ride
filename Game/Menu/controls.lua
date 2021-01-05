local upPressed=love.keyboard.isDown(upControl)
local downPressed=love.keyboard.isDown(downControl)
local leftPressed=love.keyboard.isDown(leftControl)
local rightPressed=love.keyboard.isDown(rightControl)
local ePressed=love.keyboard.isDown(eControl)
local escPressed=love.keyboard.isDown(escControl)
local checkKeyDown=assert(loadfile("Game\\Menu\\checkKeyDown.lua"))
if downPressed == false and upPressed == false and leftPressed == false and rightPressed == false and ePressed == false and escPressed == false then
	canAdvance=true
end 

text("Movement Controls","Controles De Movimiento","NAH",60,60,0.6,60,60,0.4,60,60,0.5)

if opt1Sel == true and downPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt1Sel=false
	opt2Sel=true
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
if opt4Sel == true and upPressed == true and canAdvance == true then
	playSound(menuSelectSFX)
	canAdvance=false
	opt4Sel=false
	opt3Sel=true
end

option(opt1Sel,"Move Right","SPA","NAH",60,120,0.3,60,120,0.3,60,120,0.3)
option(opt2Sel,"Move Left","SPA","NAH",60,150,0.3,60,150,0.3,60,150,0.3)
option(opt3Sel,"Move Up","SPA","NAH",60,180,0.3,60,180,0.3,60,180,0.3)
option(opt4Sel,"Move Down","SPA","NAH",60,210,0.3,60,210,0.3,60,210,0.3)
