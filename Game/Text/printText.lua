love.graphics.setColor(255,255,255)
for a,objs in ipairs(printingText) do
	local sizeExtremity=0
	local yExtremity=0
	for i,v in ipairs(printingText[objs]) do
		if i>3 then
			local textScale=printingText[objs][3]*0.5
			if v == lowerI or v == lowerSpaI or v == lowerL or v == lowerNahI or v == lowerT or v == lowerSelI or v == lowerSelSpaI or v == lowerSelL or v == lowerSelNahI or v == lowerSelT or v == period or v == selPeriod then
				if i > 3 then
					sizeExtremity=sizeExtremity+(17*ratio*textScale)
				end
			end
			local compare=printingText[objs][i-1]
			if compare == lowerI or compare == lowerSpaI or compare == lowerL or compare == lowerNahI or compare == lowerT or compare == lowerSelI or compare == lowerSelSpaI or compare == lowerSelL or compare == lowerSelNahI or compare == lowerSelT then		 
				sizeExtremity=sizeExtremity+(17*ratio*textScale)
			end
			if v == lowerG or v == lowerSelG or v == lowerY or v == lowerSelY or v == lowerP or v == lowerSelP or v == lowerQ or v == lowerSelQ then
				yExtremity=(32*ratio*textScale)
			else
				yExtremity=0
			end
			love.graphics.draw(v,printingText[objs][1]*ratio+(100*textScale*ratio*(i-4))-sizeExtremity,printingText[objs][2]*ratio+yExtremity,0,textScale*ratio,textScale*ratio)
		end
	end
end
