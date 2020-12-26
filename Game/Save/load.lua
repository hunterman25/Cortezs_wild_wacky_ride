saveLocation=assert(io.open("Game\\Save\\file.lua"))
local loadContent={}
local catting=false
local cat=""
for cha in string.gmatch(saveLocation:read(),".") do
	if cha == "," or cha == ":" or cha == "%" then
		catting=false
		table.insert(loadContent,cat)
		cat=""
	end
	if catting == true then
		cat=(cat .. cha)
	end
	if cha == "," or cha == ":" then
		catting=true
	end
end
local index=false
for i,v in ipairs(loadContent) do
	local nextVal=loadContent[i+1]
	if v == "1" and index == true then
		if nextVal == "0" then
			large=false
		end
		if nextVal == "1" then
			large=true
		end
	end
	if v == "2" and index == true then
		x=tonumber(nextVal)
	end
	if v == "3" and index == true then
		y=tonumber(nextVal)
	end
	if v == "4" and index == true then
		if nextVal == "1" then
			language="Eng"
		end
		if nextVal == "2" then
			language="Spa"
		end
		if nextVal == "3" then
			language="Nah"
		end
	end
	if v == "5" and index == true then
		masterVol=tonumber(nextVal)
	end
	if v == "6" and index == true then
		musicVol=tonumber(nextVal)
	end
	if v == "7" and index == true then
		soundVol=tonumber(nextVal)
	end

	--
	if index == true then
		index=false
	elseif index == false then
		index=true
	end
end
