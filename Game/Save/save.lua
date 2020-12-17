saveLocation=assert(io.open("Game\\Save\\file.lua","w+"))
saveContent=""
if large == false then
	saveContent=(saveContent .. ",1:0")
end
if large == true then
	saveContent=(saveContent .. ",1:1")
end
saveContent=(saveContent .. ",2:" .. x/ratio .. ",3:" .. y/ratio)
saveContent=(saveContent .. "%")
saveLocation:write(saveContent)
saveLocation:close()
saving=false
