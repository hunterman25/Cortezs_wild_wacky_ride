love.graphics.setColor(255,255,255)
for a,objs in ipairs(printingText) do
	local sizeExtremity=0
	for i,v in ipairs(printingText[objs]) do
		if i>3 then
			local textScale=printingText[objs][3]*0.5
			if v == lowerI or v == lowerSpaI or v == lowerL or v == lowerNahI or v == lowerT or v == lowerSelI or v == lowerSelSpaI or v == lowerSelL or v == lowerSelNahI or v == lowerSelT then
				if i > 3 then
					sizeExtremity=sizeExtremity+(17*ratio*textScale)
				end
				exDouble=true
			end
			love.graphics.draw(v,printingText[objs][1]*ratio+(100*textScale*ratio*(i-4))-sizeExtremity,printingText[objs][2]*ratio,0,textScale*ratio,textScale*ratio)
		end
	end
end