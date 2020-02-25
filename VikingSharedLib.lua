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

function lib:Print(...)
  local color = lib.Colors:NewRGBA(lib.Colors.YELLOW, 1):ToText()
  print(color .. addonName .. ":|r", ...)
end

function lib:Debug(strName, tData)
  if ViragDevTool_AddData then
    ViragDevTool_AddData(tData, strName)
  end
end

lib.Colors = addon.Colors
lib.Sprites = addon.Sprites