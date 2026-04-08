local assets_image, assets_add, fmt, find = assets.image, assets.add, string.format, string.find

local fridge = assets_image("/objects/biome/scorchedcity/scorchedcityfridge/scorchedcityfridge.png")
local width, height = table.unpack(fridge:size())
local z = { 0, 0 }

local files = assets.byExtension("png")
for i = 1, #files do
  local file = files[i]
  if find(file, "^/dungeons/") or find(file, "^/ships/.+blocks%.png$") then goto continue end

  local image = assets_image(file)
  local size = image:size()
  local scale = fmt("?scalenearest=%s;%s", size[1] / width, size[2] / height)
  image:copyInto(z, fridge:process(scale))
  assets_add(file, image)

  ::continue::
end
