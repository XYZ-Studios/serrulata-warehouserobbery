local QBCore = exports['qb-core']:GetCoreObject()

local CoolDown = false

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
      TriggerEvent('qb-log:server:CreateLog', 'warehouserobbery', 'Warehouse Robbery', 'red', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully Robbed Warehouse and got ' .. amount .. ' ' .. randItem, false)
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
