local addonName, addon = ...
local LSM = LibStub("LibSharedMedia-3.0")

if not LSM then return end -- Oh No Mr. Nil!

local folder = [[VikingSharedLib\assets\sounds\]]

local SOUNDS = {
  EnemySpotted = {
    name = "Enemy Spotted",
    path = [[Interface\Addons\]] .. folder .. [[enemy-spotted.mp3]],
  },
  BabyGroot = {
    name = "BabyGroot",
    path = [[Interface\Addons\]] .. folder .. [[baby-groot.mp3]],
  },
  Bear1 = {
    name = "bear 1",
    path = [[Interface\Addons\]] .. folder .. [[bear-1.mp3]],
  },
  Bear2 = {
    name = "bear 2",
    path = [[Interface\Addons\]] .. folder .. [[bear-2.mp3]],
  },
  Bear3 = {
    name = "bear 3",
    path = [[Interface\Addons\]] .. folder .. [[bear-3.mp3]],
  },
  Bear4 = {
    name = "bear 4",
    path = [[Interface\Addons\]] .. folder .. [[bear-4.mp3]],
  },
  Bear5 = {
    name = "bear 5",
    path = [[Interface\Addons\]] .. folder .. [[bear-5.mp3]],
  },
  Bear6 = {
    name = "bear 6",
    path = [[Interface\Addons\]] .. folder .. [[bear-6.mp3]],
  },
  Bear7 = {
    name = "bear 7",
    path = [[Interface\Addons\]] .. folder .. [[bear-7.mp3]],
  },
  Bear8 = {
    name = "bear 8",
    path = [[Interface\Addons\]] .. folder .. [[bear-8.mp3]],
  },
  Bear9 = {
    name = "bear 9",
    path = [[Interface\Addons\]] .. folder .. [[bear-9.mp3]],
  },
  Bear10 = {
    name = "bear 10",
    path = [[Interface\Addons\]] .. folder .. [[bear-10.mp3]],
  },
  GrizzlyBear1 = {
    name = "Grizzly Bear 1",
    path = [[Interface\Addons\]] .. folder .. [[grizzly-bear-1.mp3]],
  },
  GrizzlyBear2 = {
    name = "Grizzly Bear 2",
    path = [[Interface\Addons\]] .. folder .. [[grizzly-bear-2.mp3]],
  },
  GrizzlyBear3 = {
    name = "Grizzly Bear 3",
    path = [[Interface\Addons\]] .. folder .. [[grizzly-bear-3.mp3]],
  },
  Koala = {
    name = "Koala 1",
    path = [[Interface\Addons\]] .. folder .. [[koala.mp3]],
  },
  PolarBear1 = {
    name = "Polar Bear 1",
    path = [[Interface\Addons\]] .. folder .. [[polar-bear-1.mp3]],
  },
  PolarBear2 = {
    name = "Polar Bear 2",
    path = [[Interface\Addons\]] .. folder .. [[polar-bear-2.mp3]],
  },
  PolarBear3 = {
    name = "Polar Bear 3",
    path = [[Interface\Addons\]] .. folder .. [[polar-bear-3.mp3]],
  },
}

for key, data in pairs(SOUNDS) do
  LSM:Register("sound", data.name, data.path)
end

addon.SOUNDS = SOUNDS