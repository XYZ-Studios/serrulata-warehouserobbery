local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = 0
local PlayerJob = {}

RegisterNetEvent('police:SetCopCount', function(amount)
  CurrentCops = amount
end)

RegisterNetEvent('warehouse:client:target:pickupPackage', function ()
  QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerJob = PlayerData.job
      if PlayerData.job.name ~= "police" then
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
      else
        QBCore.Functions.Notify('You Cheecky Fuck', 'primary', 8000)
      end
  end)
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
  ExportLocation1()
  ExportLocation2()
  ExportLocation3()
  ExportLocation4()
  ExportLocation5()
  ExportLocation6()
  DoScreenFadeIn(500)
end)

RegisterNetEvent('warehouse:ExitDoor', function(data)
  DoScreenFadeOut(500)
  Wait(1000)
  SetEntityCoords(PlayerPedId(), Config.OutsideLocation.x, Config.OutsideLocation.y, Config.OutsideLocation.z)
  TriggerServerEvent('serrulata-warehouse:server:coolout')
  DoScreenFadeIn(500)
  Wait(6000)
  WarehouseGuards()
end)



-- Door thread

RegisterNetEvent('warehouse:EnterLocation', function()
  if CurrentCops >= Config.Cops then
      QBCore.Functions.TriggerCallback("serrulata-warehouse:server:coolc",function(isCooldown)
      if not isCooldown then
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
      else
        QBCore.Functions.Notify("System seems to be on a cooldown", 'error')
      end
    end)
  else
    QBCore.Functions.Notify("Not Enough Police On!", 'error')
  end
end)


-- Selling

RegisterNetEvent('warehouse:openMenu', function()
  local shop = {
      {
          header = 'Electronic Store',
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

RegisterCommand('spawnguards', function()
    WarehouseGuards()
end)

function WarehouseGuards()
  if Config.Patrol == true then
      RequestModel('dilettante2')
      while not HasModelLoaded('dilettante2') do
          Wait(1)
      end

      RequestModel(`s_m_m_security_01`)
      while not HasModelLoaded(`s_m_m_security_01`) do
          Wait(1)
      end

      RequestModel(`s_m_m_security_01`)
      while not HasModelLoaded(`s_m_m_security_01`) do
          Wait(1)
      end
      
      local vehicle = CreateVehicle('dilettante2', vector4(687.6, -2066.9, 28.79, 263.33), true, false)

      local driver = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, -1, true, false)

      if Config.Guards == 1 then
        local passenger = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 0, true, false)
        SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger, PlayerPedId())
        SetPedAccuracy(passenger, Config.PassengerAccuracy)
        SetPedCombatRange(passenger, 0)
      else
      end
      if Config.Guards == 2 then
        local passenger = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 0, true, false)
        local passenger2 = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 1, true, false)
        SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger, PlayerPedId())
        SetPedAccuracy(passenger, Config.PassengerAccuracy)
        SetPedCombatRange(passenger, 0)
  
        SetPedRelationshipGroupHash(passenger2, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger2, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger2, PlayerPedId())
        SetPedAccuracy(passenger2, Config.PassengerAccuracy)
        SetPedCombatRange(passenger2, 0)
      else
      end
      if Config.Guards == 3 then
        local passenger = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 0, true, false)
        local passenger2 = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 1, true, false)
        local passenger3 = CreatePedInsideVehicle(vehicle, 6, `s_m_m_security_01`, 2, true, false)
        SetPedRelationshipGroupHash(passenger, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger, PlayerPedId())
        SetPedAccuracy(passenger, Config.PassengerAccuracy)
        SetPedCombatRange(passenger, 0)
  
        SetPedRelationshipGroupHash(passenger2, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger2, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger2, PlayerPedId())
        SetPedAccuracy(passenger2, Config.PassengerAccuracy)
        SetPedCombatRange(passenger2, 0)
  
        SetPedRelationshipGroupHash(passenger3, GetHashKey("HATES_PLAYER"))
        GiveWeaponToPed(passenger3, GetHashKey(Config.PassengerWeapon), Config.PassengerAmmo, false, true)
        TaskDriveBy(passenger3, PlayerPedId())
        SetPedAccuracy(passenger3, Config.PassengerAccuracy)
        SetPedCombatRange(passenger3, 0)
      else
      end

      local Player = GetEntityCoords(PlayerPedId())

      TaskVehicleFollow(driver, vehicle, PlayerPedId(), -1, 6, 1)
      TaskVehicleChase(driver, Player)
      SetPedCombatRange(driver, 2)
      SetPedFleeAttributes(driver, 0, 0)
      SetPedCombatAttributes(driver, 46, true)
      SetPedCombatAttributes(driver, 1, true)
      SetPedCombatAttributes(driver, 2, true)
      SetPedRelationshipGroupHash(driver, GetHashKey("HATES_PLAYER"))
      SetEntityInvincible(driver, false)
      SetPedSeeingRange(driver, 0.0)
      SetPedHearingRange(driver, 0.0)
      SetPedAlertness(driver, 3) 
      SetPedKeepTask(driver, true)
      SetVehicleEngineOn(vehicle, true, 1, 1)
  else
  end

end
