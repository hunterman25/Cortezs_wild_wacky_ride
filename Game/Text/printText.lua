love.graphics.setColor(255,255,255)
for a,objs in ipairs(printingText) do
	sizeExtremity=0
	for i,v in ipairs(printingText[objs]) do
		if i>3 then
			local textScale=printingText[objs][3]*0.5
			if exDouble == true then
				sizeExtremity=sizeExtremity+7
				exDouble=false
			end
			if v == lowerI or v == lowerÍ or v == lowerL or v == lowerNahI or v == lowerT then
				if i > 3 then
					sizeExtremity=sizeExtremity+(10*ratio*textScale)
				end
				exDouble=true
			end
			love.graphics.draw(v,printingText[objs][1]*ratio+(100*textScale*ratio*(i-4))-sizeExtremity,printingText[objs][2]*ratio,0,textScale*ratio,textScale*ratio)
		end
	end
end