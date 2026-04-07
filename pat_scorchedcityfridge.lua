local fridge = assets.image("/objects/biome/scorchedcity/scorchedcityfridge/scorchedcityfridge.png")
local width, height = table.unpack(fridge:size())
local z = { 0, 0 }

for _, file in next, assets.byExtension("png") do
  local image = assets.image(file)
  local size = image:size()
  local scale = ("?scalenearest=%s;%s"):format(size[1] / width, size[2] / height)
  image:copyInto(z, fridge:process(scale))
  assets.add(file, image)
end
