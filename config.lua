Config = {}

UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.HackItem = 'electronickit' -- item used to hack things you are free to change it to whatever you want
Config.HackType = 'greek' -- can be alphabet, numeric, alphanumeric, greek, braille, runes
Config.HackTime = 25 --how long to do minigame
Config.HackingTime = 15 --how long for hacking progressbars
Config.InsideLocation = vector3(1087.83, -3099.53, -39.0) -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
Config.OutsideLocation = vector3(719.37, -2102.86, 29.65) -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
Config.MaxItemsReceived = 2 -- Max amount of items you can get per box
Config.MinItemReceivedQty = 1 -- Min amount of a certain item you can get at a time
Config.MaxItemReceivedQty = 2 -- Max amount of a certain item you can get at a time
Config.CoolDown = 10 -- How many minutes it takes until it can be looted again



Config.PickupLocations = { -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
	[1] = vector3(1088.79, -3096.72, -40.0), 
	[2] = vector3(1091.31, -3096.72, -40.0), 
	[3] = vector3(1095.22, -3096.64, -40.0), 
	[4] = vector3(1101.31, -3096.64, -40.0), 
	[5] = vector3(1103.89, -3096.87, -40.0), 
	[6]	= vector3(1097.75, -3096.82, -40.0), 
}
Config.WarehouseObjects = { -- Change these if you got a better object model or want a different one
	[1] = "prop_boxpile_05a",
	[2] = "prop_boxpile_04a",
	[3] = "prop_boxpile_06b",
	[4] = "prop_boxpile_02c",
	[5] = "prop_boxpile_02b",
	[6] = "prop_boxpile_01a",
	[7] = "prop_boxpile_08a",
}
Config.ItemTable = { -- These are the items that can be optained from the robbery
	[1] = "iphone",
	[2] = "samsungphone",
	[3] = "laptop",
	[4] = "tablet",
	[5] = "samsungtv",
}
