local QBCore = exports['qb-core']:GetCoreObject()
local packageCoords = nil

RegisterNetEvent('police:SetCopCount', function(amount)
  CurrentCops = amount
end)

local function GetRandomPackage()
  packageCoords = ss.PickupLocations[math.random(1, #ss.PickupLocations)]
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
  for i = 1, #ss.PickupLocations do
    local coord = ss.PickupLocations[i].coords
    print(coord)
        local model = GetHashKey(ss.WarehouseObjects[math.random(1, #ss.WarehouseObjects)])
        RequestModel(model)
        while not HasModelLoaded(model) do
          Wait(0)
        end
        local obj = CreateObject(model, coord.x, coord.y, coord.z, false, true, true)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
    end
end

-- Door Event

RegisterNetEvent('warehouse:EnterDoor', function(data)
  DoScreenFadeOut(500)
  Wait(1000)
  buildInteriorDesign()
  SetEntityCoords(PlayerPedId(), ss.InsideLocation.x, ss.InsideLocation.y, ss.InsideLocation.z)
  SetEntityHeading(PlayerPedId(), 266.59)
  DoScreenFadeIn(500)
end)

RegisterNetEvent('warehouse:ExitDoor', function(data)
  DoScreenFadeOut(500)
  Wait(1000)
  SetEntityCoords(PlayerPedId(), ss.OutsideLocation.x, ss.OutsideLocation.y, ss.OutsideLocation.z)
  SetEntityHeading(PlayerPedId(), 267.58)
  DoScreenFadeIn(500)
end)


function hasHackItem()
  local count = exports.ox_inventory:Search('count', ss.HackItem)
  if count > 0 then
      return true
  else
      lib.notify({
          title = 'ERROR!',
          description = 'Do not have the required item!',
          type = 'error'
      }) 
  end
end

-- Door thread

RegisterNetEvent('warehouse:EnterLocation', function()
    if hasHackItem() == true then
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
            end, ss.HackType, ss.HackTime, 0)
          end
end)

