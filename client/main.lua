local QBCore = exports['qb-core']:GetCoreObject()
local packageCoords = nil

RegisterNetEvent('police:SetCopCount', function(amount)
  CurrentCops = amount
end)

local function GetRandomPackage()
  packageCoords = Config.PickupLocations[math.random(1, #Config.PickupLocations)]
  RegisterPickupTarget(packageCoords)
end

RegisterNetEvent('warehouse:client:target:pickupPackage', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
  QBCore.Functions.Progressbar('cnct_elect', 'Looking for Valuble items!', 5000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    }, {}, {}, {}, function()
    end)
  Wait(5000)
  TriggerServerEvent('warehouse:server:getItem')
end)

local function buildInteriorDesign()
    for _, pickuploc in pairs(Config.PickupLocations) do
      local model = GetHashKey(Config.WarehouseObjects[math.random(1, #Config.WarehouseObjects)])
      RequestModel(model)
      while not HasModelLoaded(model) do
        Wait(0)
      end
      local obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
      PlaceObjectOnGroundProperly(obj)
      FreezeEntityPosition(obj, true)
    end
end

-- Door Event

RegisterNetEvent('warehouse:EnterDoor', function(data)
  DoScreenFadeOut(500)
  Wait(1000)
  buildInteriorDesign()
  SetEntityCoords(PlayerPedId(), Config.InsideLocation.x, Config.InsideLocation.y, Config.InsideLocation.z)
  DoScreenFadeIn(500)
end)

RegisterNetEvent('warehouse:ExitDoor', function(data)
  DoScreenFadeOut(500)
  Wait(1000)
  SetEntityCoords(PlayerPedId(), Config.OutsideLocation.x, Config.OutsideLocation.y, Config.OutsideLocation.z)
  DoScreenFadeIn(500)
end)



-- Door thread

RegisterNetEvent('warehouse:EnterLocation', function()
    if QBCore.Functions.HasItem(Config.HackItem) then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar('cnct_elect', 'Rewiring the Security System...', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
        Wait(5000)
      
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        exports['ps-ui']:Scrambler(function(success)
            if success then
                Wait(100)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
                Wait(500)
                QBCore.Functions.Progressbar('po_usb', 'Making Final Adjustments..', 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                end)
                Wait(4000)
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify('You Successfully Rewired the Door! You got 100 seconds on you before police gets alerted!!!', 'primary', 8000)
                Wait(1000)
                TriggerEvent('warehouse:EnterDoor')
                Wait(100000)
                exports["ps-dispatch"]:CustomAlert({
                  coords = vector3(720.03, -2102.93, 29.24),
                  message = "Warehouse Robbery",
                  dispatchCode = "69-420",
                  description = "Warehouse Robbery",
                  radius = 0,
                  sprite = 357,
                  color = 2,
                  scale = 0.7,
                  length = 3,
                })
            else
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify('Police Was Alerted!', 'error', 2000)
                exports["ps-dispatch"]:CustomAlert({
                  coords = vector3(720.03, -2102.93, 29.24),
                  message = "Attempted Warehouse Robbery",
                  dispatchCode = "69-420",
                  description = "Attempted Warehouse Robbery",
                  radius = 0,
                  sprite = 357,
                  color = 2,
                  scale = 0.7,
                  length = 3,
                })
                end
            end, Config.HackType, Config.HackTime, 0)
        else
            QBCore.Functions.Notify('You dont have the right tools', 'error', 3000)
        end 
end)


-- Selling

RegisterNetEvent('warehouse:openMenu', function()
  local shop = {
      {
          header = 'Digital Den',
          isMenuHeader = true,
      },
      {
          header = 'Sell Iphone',
          icon = 'fas fa-hand-holding',
          params = {
              isServer = true,
              event = 'warehouse:server:sellIphone'
          }
      },
      {
        header = 'Sell Samsung Phone',
        icon = 'fas fa-hand-holding',
        params = {
          isServer = true,
            event = 'warehouse:server:sellSamsungPhone'
        }
      },
      {
        header = 'Sell TV',
        icon = 'fas fa-hand-holding',
        params = {
          isServer = true,
            event = 'warehouse:server:sellTV'
        }
      },
      {
        header = 'Sell Tablet',
        icon = 'fas fa-hand-holding',
        params = {
          isServer = true,
            event = 'warehouse:server:sellTablet'
        }
      },
      {
        header = 'Sell Laptop',
        icon = 'fas fa-hand-holding',
        params = {
          isServer = true,
            event = 'warehouse:server:sellLaptop'
        }
      },
      {
          header = 'Walk Away',
          icon = 'fas fa-xmark',

      }
  }
  exports['qb-menu']:openMenu(shop)
end)
