local function volCompare(name,channel)
	if channel <= masterVol then
		name:setVolume(channel/100)
	elseif channel > masterVol then
		name:setVolume(masterVol/100)
	end
end
volCompare(menuBlipSFX,soundVol/2)
volCompare(menuSelectSFX,soundVol)
