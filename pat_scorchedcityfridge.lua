local assets_image, assets_add, fmt, find = assets.image, assets.add, string.format, string.find

local fridge = assets_image("/objects/biome/scorchedcity/scorchedcityfridge/scorchedcityfridge.png")
local width, height = table.unpack(fridge:size())
local files = assets.byExtension("png")

for i = 1, #files do
  local file = files[i]
  if find(file, "^/dungeons/") or find(file, "^/ships/.+blocks%.png$") then goto continue end

  local size = assets_image(file):size()
  local scale = fmt("?scalenearest=%s;%s", size[1] / width, size[2] / height)
  assets_add(file, fridge:process(scale))

  ::continue::
end
