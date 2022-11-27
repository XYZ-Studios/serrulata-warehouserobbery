ss = {}

ss.Debug = false

ss.HackItem = 'electronickit' -- item used to hack things you are free to change it to whatever you want
ss.HackType = 'greek' -- can be alphabet, numeric, alphanumeric, greek, braille, runes
ss.HackTime = 25 --how long to do minigame
ss.HackingTime = 15 --how long for hacking progressbars
ss.InsideLocation = vector3(1087.83, -3099.53, -39.0) -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
ss.OutsideLocation = vector3(719.37, -2102.86, 29.65) -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
ss.MaxItemsReceived = 2 -- Max amount of items you can get per box
ss.MinItemReceivedQty = 1 -- Min amount of a certain item you can get at a time
ss.MaxItemReceivedQty = 2 -- Max amount of a certain item you can get at a time


ss.SellGoodsLocations = true -- if you want to sell goods from the warehouse or not

ss.PickupLocations = { -- DO NOT CHANGE THESE IF YOU HAVE NOT CHANGED THE target.lua FIRST
	[1] = {coords = vector3(1088.79, -3096.72, -40.0)},
	[2] = {coords = vector3(1091.31, -3096.72, -40.0)},
	[3] = {coords = vector3(1095.22, -3096.64, -40.0)},
	[4] = {coords = vector3(1101.31, -3096.64, -40.0)},
	[5] = {coords = vector3(1103.89, -3096.87, -40.0)},
	[6]	= {coords = vector3(1097.75, -3096.82, -40.0)},
}
ss.WarehouseObjects = { -- Change these if you got a better object model or want a different one
	[1] = "prop_boxpile_05a",
	[2] = "prop_boxpile_04a",
	[3] = "prop_boxpile_06b",
	[4] = "prop_boxpile_02c",
	[5] = "prop_boxpile_02b",
	[6] = "prop_boxpile_01a",
	[7] = "prop_boxpile_08a",
}
ss.ItemTable = { -- These are the items that can be optained from the robbery
	[1] = {item = "iphone", price = math.random(150, 250)},
	[2] = {item = "samsungphone", price = math.random(150, 250)},
	[3] = {item = "laptop", price = math.random(150, 250)},
	[4] = {item = "tablet", price = math.random(150, 250)},
	[5] = {item = "samsungtv", price = math.random(150, 250)},
}
