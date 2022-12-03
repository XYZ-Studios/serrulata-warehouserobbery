local QBCore = exports['qb-core']:GetCoreObject()

local CoolDown = false

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1048669919052583035/jwfI6oDb7awl6g2vtIXKr2EngrAN4DA61c2YwQI00HhZfs1AUrTIqk9HsNvGwPaJm1fc',
    ['warehouserobbery'] = 'https://discord.com/api/webhooks/1048669919052583035/jwfI6oDb7awl6g2vtIXKr2EngrAN4DA61c2YwQI00HhZfs1AUrTIqk9HsNvGwPaJm1fc',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('serrulata:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Warehouse Logs',
                ['icon_url'] = 'https://cdn.discordapp.com/avatars/1024388797707845752/c87901ddf29cbde5a59cf239a77313fd.png?size=4096',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Warehouse Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Warehouse Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)



-- Events

RegisterServerEvent('serrulata-warehouse:server:coolout', function()
    CoolDown = true
    local timer = Config.CoolDown * (60 * 1000)
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            CoolDown = false
            TriggerClientEvent('serrulata-warehouse:client:cooldown')
        end
    end
end)

QBCore.Functions.CreateCallback("serrulata-warehouse:server:coolc",function(source, cb)
    if CoolDown then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('warehouse:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
      local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
      local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
      Player.Functions.AddItem(randItem, amount)
      TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
      Wait(500)
      TriggerEvent('serrulata:server:CreateLog', 'warehouserobbery', 'Warehouse Robbery', 'red', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully Robbed Warehouse and got ' .. amount .. ' ' .. randItem, false)
    end
end)

-- Selling

RegisterNetEvent('warehouse:server:sellIphone', function ()
    local price = math.random(120,220)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local oilwell = Player.Functions.GetItemByName('iphone')
    if oilwell then
        Player.Functions.RemoveItem('iphone', 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['iphone'], 'remove')
        Player.Functions.AddMoney('cash', price, 'Sold Item')
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, 'Nothing to Sell', 'error')
    end
end)

RegisterNetEvent('warehouse:server:sellSamsungPhone', function ()
    local price = math.random(120,220)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local oilwell = Player.Functions.GetItemByName('samsungphone')
    if oilwell then
        Player.Functions.RemoveItem('samsungphone', 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['samsungphone'], 'remove')
        Player.Functions.AddMoney('cash', price, 'Sold Item')
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, 'Nothing to Sell', 'error')
    end
end)

RegisterNetEvent('warehouse:server:sellTV', function ()
    local price = math.random(250,500)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local oilwell = Player.Functions.GetItemByName('samsungtv')
    if oilwell then
        Player.Functions.RemoveItem('samsungtv', 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['samsungtv'], 'remove')
        Player.Functions.AddMoney('cash', price, 'Sold Item')
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, 'Nothing to Sell', 'error')
    end
end)

RegisterNetEvent('warehouse:server:sellTablet', function ()
    local price = math.random(180,280)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local oilwell = Player.Functions.GetItemByName('tablet')
    if oilwell then
        Player.Functions.RemoveItem('tablet', 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['tablet'], 'remove')
        Player.Functions.AddMoney('cash', price, 'Sold Item')
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, 'Nothing to Sell', 'error')
    end
end)

RegisterNetEvent('warehouse:server:sellLaptop', function ()
    local price = math.random(220,320)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local oilwell = Player.Functions.GetItemByName('laptop')
    if oilwell then
        Player.Functions.RemoveItem('laptop', 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['laptop'], 'remove')
        Player.Functions.AddMoney('cash', price, 'Sold Item')
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, 'Nothing to Sell', 'error')
    end
end)
