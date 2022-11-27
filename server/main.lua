local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('warehouse:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, ss.MaxItemsReceived), 1 do
        local i = math.random(1, #ss.ItemTable)
        local item = ss.ItemTable[i].item
        local amount = math.random(ss.MinItemReceivedQty, ss.MaxItemReceivedQty)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        print(item)
    end
end)

--random items from a sting

-- Selling

RegisterNetEvent('warehouse:server:sellIphone', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    Player.Functions.RemoveItem(ss.ItemTable[1].item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[ss.ItemTable[1].item], 'remove')
    Player.Functions.AddMoney('cash', ss.ItemTable[1].price, 'Sold Item')
end)

RegisterNetEvent('warehouse:server:sellSamsungPhone', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    Player.Functions.RemoveItem(ss.ItemTable[2].item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[ss.ItemTable[2].item], 'remove')
    Player.Functions.AddMoney('cash', ss.ItemTable[2].price, 'Sold Item')
end)

RegisterNetEvent('warehouse:server:sellLaptop', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    Player.Functions.RemoveItem(ss.ItemTable[3].item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[ss.ItemTable[3].item], 'remove')
    Player.Functions.AddMoney('cash', ss.ItemTable[3].price, 'Sold Item')
end)

RegisterNetEvent('warehouse:server:sellTablet', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    Player.Functions.RemoveItem(ss.ItemTable[4].item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[ss.ItemTable[4].item], 'remove')
    Player.Functions.AddMoney('cash', ss.ItemTable[4].price, 'Sold Item')
end)

RegisterNetEvent('warehouse:server:sellTV', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    Player.Functions.RemoveItem(ss.ItemTable[5].item, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[ss.ItemTable[5].item], 'remove')
    Player.Functions.AddMoney('cash', ss.ItemTable[5].price, 'Sold Item')
end)