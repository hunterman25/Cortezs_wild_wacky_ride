saveLocation=assert(io.open("Game\\Save\\file.lua","w+"))
saveContent=""
local function saveAdd(index,value)
	saveContent=(saveContent .. "," .. index .. ":" .. value)
end
if large == false then
	saveAdd(1,0)
elseif large == true then
	saveAdd(1,1)
end
saveAdd(2,x/ratio)
saveAdd(3,y/ratio)
if language == "Eng" then
	saveAdd(4,1)
elseif language == "Spa" then
	saveAdd(4,2)
elseif language == "Nah" then
	saveAdd(4,3)
end
saveAdd(5,masterVol)
saveAdd(6,musicVol)
saveAdd(7,soundVol)
saveAdd(8,rightControl)
saveAdd(9,leftControl)
saveAdd(10,upControl)
saveAdd(11,downControl)
saveAdd(12,eControl)
saveAdd(13,escControl)

--
saveContent=(saveContent .. "%")
saveLocation:write(saveContent)
saveLocation:close()
saving=false
