if predetermined ~= true then
	tileSelected = {"x","y"}
	tileSelected["x"]=1
	tileSelected["y"]=1
	predetermined=true
end
local menuSlot=love.graphics.newImage("Menu/menuSlot.png")
local menuSlotSelected=love.graphics.newImage("Menu/menuSlotSelected.png")
local upPressed=love.keyboard.isDown("up")
local downPressed=love.keyboard.isDown("down")
local leftPressed=love.keyboard.isDown("left")
local rightPressed=love.keyboard.isDown("right")
local ePressed=love.keyboard.isDown("e")
local escPressed=love.keyboard.isDown("escape")
if downPressed == false and upPressed == false and leftPressed == false and rightPressed == false and ePressed == false and escPressed == false then
	canAdvance=true
end 

inv={"row1","row2","row3","row4","row5","row6","row7","row8","row9"}
inv["row1"]={"0","0","0","0","0","0","0","0","0"}
inv["row2"]={"0","0","0","0","0","0","0","0","0"}
inv["row3"]={"0","0","0","0","0","0","0","0","0"}
inv["row4"]={"0","0","0","0","0","0","0","0","0"}
inv["row5"]={"0","0","0","0","0","0","0","0","0"}
inv["row6"]={"0","0","0","0","0","0","0","0","0"}
inv["row7"]={"0","0","0","0","0","0","0","0","0"}
inv["row8"]={"0","0","0","0","0","0","0","0","0"}
inv["row9"]={"0","0","0","0","0","0","0","0","0"}

for y,a in ipairs(inv) do
	for x,b in ipairs(inv[a]) do
		if tileSelected["x"] ~= x or tileSelected["y"] ~= y then
			love.graphics.draw(menuSlot,(60*ratio)+(55*ratio*(x-1)),(60*ratio)+(55*ratio*(y-1)),0,ratio)
		elseif tileSelected["x"] == x and tileSelected["y"] == y then
			love.graphics.draw(menuSlotSelected,(60*ratio)+(55*ratio*(x-1)),(60*ratio)+(55*ratio*(y-1)),0,ratio)
			love.graphics.print(x .. ", " .. y,10,10,0,2)
		end
	end
end

if rightPressed == true and canAdvance == true then
	canAdvance=false
	if tileSelected["x"] < 9 then
		tileSelected["x"]=tileSelected["x"]+1
	else
		tileSelected["x"]=tileSelected["x"]-8
	end
end
if leftPressed == true and canAdvance == true then
	canAdvance=false
	if tileSelected["x"] > 1 then
		tileSelected["x"]=tileSelected["x"]-1
	else
		tileSelected["x"]=tileSelected["x"]+8
	end
end
if downPressed == true and canAdvance == true then
	canAdvance=false
	if tileSelected["y"] < 9 then
		tileSelected["y"]=tileSelected["y"]+1
	else
		tileSelected["y"]=tileSelected["y"]-8
	end
end
if upPressed == true and canAdvance == true then
	canAdvance=false
	if tileSelected["y"] > 1 then
		tileSelected["y"]=tileSelected["y"]-1
	else
		tileSelected["y"]=tileSelected["y"]+8
	end
end
