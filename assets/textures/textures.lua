local _, addon = ...

local LSM = LibStub("LibSharedMedia-3.0")

if not LSM then return end -- Oh No Mr. Nil!

local folder = [[VikingSharedLib\assets\textures\]]

VH_TEXTURES = {
  -- Interface\Addons\VikingHud\textures\
  DRUID_ICON = {
    type = "background",
    name = "Druid Icon",
    path = [[Interface\Addons\]] .. folder .. [[druid.tga]],
  },
  HUNTER_ICON = {
    type = "background",
    name = "Hunter Icon",
    path = [[Interface\Addons\]] .. folder .. [[hunter.tga]],
  },
  MAGE_ICON = {
    type = "background",
    name = "Mage Icon",
    path = [[Interface\Addons\]] .. folder .. [[mage.tga]],
  },
  PALADIN_ICON = {
    type = "background",
    name = "Paladin Icon",
    path = [[Interface\Addons\]] .. folder .. [[paladin.tga]],
  },
  PRIEST_ICON = {
    type = "background",
    name = "Priest Icon",
    path = [[Interface\Addons\]] .. folder .. [[priest.tga]],
  },
  ROGUE_ICON = {
    type = "background",
    name = "Rogue Icon",
    path = [[Interface\Addons\]] .. folder .. [[rogue.tga]],
  },
  SHAMAN_ICON = {
    type = "background",
    name = "Shaman Icon",
    path = [[Interface\Addons\]] .. folder .. [[shaman.tga]],
  },
  WARLOCK_ICON = {
    type = "background",
    name = "Warlock Icon",
    path = [[Interface\Addons\]] .. folder .. [[warlock.tga]],
  },
  WARRIOR_ICON = {
    type = "background",
    name = "Warrior Icon",
    path = [[Interface\Addons\]] .. folder .. [[warrior.tga]],
  },

  SOLID = {
    type = "background",
    name = "solid",
    path = [[Interface\Addons\]] .. folder .. [[solid.tga]],
  },

  STATUSBAR = {
    type = "statusbar",
    name = "slanted dash",
    path = [[Interface\Addons\]] .. folder .. [[status-bar.tga]]
  },
  STATUSBAR_RIGHT = {
    type = "statusbar",
    name = "slanted dash right",
    path = [[Interface\Addons\]] .. folder .. [[status-bar-right.tga]]
  },

  X_ICON = {
    type = "background",
    name = "x icon",
    path = [[Interface\Addons\]] .. folder .. [[x.tga]]
  },

  TRASH_ICON = {
    type = "background",
    name = "trash icon",
    path = [[Interface\Addons\]] .. folder .. [[trash.tga]]
  },

  CHANNEL_ICON = {
    type = "background",
    name = "channel icon",
    path = [[Interface\Addons\]] .. folder .. [[channel.tga]]
  },

}

-- From SharedMedia
for name, data in pairs(VH_TEXTURES) do
  LSM:Register(data.type, data.name, data.path)
end

local SPRITES = {
  ["sprites.tga"] = {
    path = [[Interface\Addons\]] .. folder .. [[sprites.tga]],
    grid = 16,
    width = 128,
    height = 128,

    sprites = {
      -- col, row
      plus = { 1, 1 },
      plusFill = { 2, 1 },
      lock = { 1, 2 },
      unlock = { 2, 2 },
      settings = { 3, 3 },
      trash = { 3, 1 },
      x = { 1, 3 },
      edit = { 2, 3 },
      resize = { 3, 2 },
      channel = { 4, 3 },
      show = { 4, 2 },
      hide = { 5, 2 },
      expand = { 6, 1 },
      collapse = { 5, 1 },
      hamburger = { 5, 3 },
    }
  }
}

local Sprites = {}
function Sprites:GetSprite(file, name)
  local sheet = SPRITES[file]
  local positions = sheet.sprites[name]
  local left = ((positions[1] - 1) * sheet.grid) / sheet.width
  local right = ((positions[1]) * sheet.grid) / sheet.width
  local top = ((positions[2] - 1) * sheet.grid) / sheet.height
  local bottom = ((positions[2]) * sheet.grid) / sheet.height

  return sheet.path, {left, right, top, bottom}
end

function Sprites:GetTextSprite(file, name, color)
  local sheet = SPRITES[file]
  local positions = sheet.sprites[name]
  local left = (positions[1] - 1) * sheet.grid
  local right = (positions[1]) * sheet.grid
  local top = (positions[2] - 1) * sheet.grid
  local bottom = (positions[2]) * sheet.grid

  return "|T" ..
    sheet.path ..
    ":0:0:0:0:128:128:" ..
    left .. ":" ..
    right .. ":" ..
    top .. ":" ..
    bottom ..
    (color and ":" .. color.r * 255 .. ":" .. color.g * 255 .. ":" .. color.b * 255 or "") ..
    "|t"
end

function Sprites:SetSprite(tex, file, name)
  local path, coords = self:GetSprite(file, name)
  tex:SetTexture(path)
  tex:SetTexCoord(unpack(coords))
  return tex
end

addon.Sprites = Sprites