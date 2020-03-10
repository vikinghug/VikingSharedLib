local addonName, addon = ...

local major = "VikingSharedLib"
local minor = 90000 + tonumber(("$Revision: 55 $"):match("(%d+)"))

if not LibStub then error(major .. " requires LibStub") end

local lib, oldLibMinor = LibStub:NewLibrary(major, minor)
if not lib then return end

function lib:ApplyMixin(base, mixin)
  for k, v in pairs(mixin) do
    base[k] = v
  end

  return base
end

function lib:StartsWith(str, start)
  return str:sub(1, #start) == start
end

function lib:EndsWith(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

local PrintColors = {
  addon.Colors.RED:ToText(),
  addon.Colors.DARK_RED:ToText(),
  addon.Colors.ORANGE:ToText(),
  addon.Colors.BLUE:ToText(),
  addon.Colors.PALE_BLUE:ToText(),
  addon.Colors.GREEN:ToText(),
  addon.Colors.DARK_GREEN:ToText(),
  addon.Colors.PALE_GREEN:ToText(),
  addon.Colors.YELLOW:ToText(),
  addon.Colors.PALE_YELLOW:ToText(),
  addon.Colors.PINK:ToText(),
  addon.Colors.DARK_PINK:ToText(),
  addon.Colors.CYAN:ToText(),
}

function lib:Print(...)
  local n = 0
  (self.name or addonName):gsub(".", function(c) n = n + string.byte(c) end)
  local color = PrintColors[((n - 1) % #PrintColors) + 1]
  print(color .. (self.name or addonName) .. [[:|r]], ...)
end

function lib:Debug(strName, tData)
  if ViragDevTool_AddData then
    ViragDevTool_AddData(tData, strName)
  end
end

function lib:RegisterName(name)
  self.name = name
end

lib.Colors = addon.Colors
lib.Sprites = addon.Sprites