box1 = false
box2 = false
box3 = false
box4 = false
box5 = false
box6 = false
drawZones = ss.Debug

CreateThread(function()
exports.ox_target:addBoxZone({ -- Crim Enter
  coords =  vector3(719.25, -2101.69, 29.24),
  size = vec3(1, 1, 1),
  radius = 1.5,
  debug = drawZones,
  options = {
    {
      name = 'sphere',
      event = 'warehouse:EnterLocation',
      icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
      label = 'Rewire Electrical System',
      canInteract = function(entity, distance, coords, name)
          return distance < 1
      end
    }
  }
})
exports.ox_target:addBoxZone({ -- Exit
  coords = vector3(1087.18, -3099.36, -39.0),
  size = vec3(2, 2, 5),
  radius = 1.5,
  debug = drawZones,
  options = {
    {
      type = "client",
      event = "warehouse:ExitDoor",
      icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
      label = "Exit",
      canInteract = function(entity, distance, coords, name)
          return distance < 1
      end
    }
  }
})
exports.ox_target:addBoxZone({ -- Cop Enter
  coords = vector3(719.2, -2102.8, 29.24),
  size = vec3(1, 1, 5),
  radius = 1.5,
  debug = drawZones,
  options = {
    {
      type = "client",
      event = "warehouse:EnterDoor",
      groups = {"police"},
      icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
      label = "Breach Door",
      canInteract = function(entity, distance, coords, name)
          return distance < 1
      end
    }
  }
})
  if ss.SellGoodsLocations == true then
    exports.ox_target:addBoxZone({ -- sell electronics
      coords = vector3(-658.74, -855.38, 24.49),
      size = vec3(1, 1, 5),
      radius = 1,
      debug = drawZones,
      options = {
        {
          type = "client",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Sell Electronics",
          onSelect = function()
            lib.showContext('sell_openmenu')
            box3 = true
          end,
          canInteract = function(entity, distance, coords, name)
              return distance < 1
          end
        }
      }
    })
  end
end)
  
CreateThread(function() -- Boxes
  exports.ox_target:addBoxZone({ -- Box 1
    coords = vector3(1088.79, -3096.72, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box1 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box1 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })
  exports.ox_target:addBoxZone({ -- Box 2
    coords = vector3(1091.31, -3096.72, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box2 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box2 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })

  exports.ox_target:addBoxZone({ -- Box 3
    coords = vector3(1095.22, -3096.64, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box3 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box3 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })
  exports.ox_target:addBoxZone({ -- Box 4
    coords = vector3(1101.31, -3096.64, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box4 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box4 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })
  exports.ox_target:addBoxZone({ -- Box 5
    coords = vector3(1103.89, -3096.87, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box5 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box5 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })
  exports.ox_target:addBoxZone({ -- Box 6
    coords = vector3(1097.75, -3096.82, -40.0),
    size = vec3(2, 2, 5),
    radius = 1.5,
    debug = drawZones,
    options = {
      {
        name = 'sphere',
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Box',
        onSelect = function()
          TriggerEvent("warehouse:client:target:pickupPackage")
          box6 = true
        end,
        canInteract = function(entity, distance, coords, name)
          if box6 == false and distance < 1 then
              return true
          else
              return false
          end
      end,
      }
    }
  })
end)

lib.registerContext({
  id = 'sell_openmenu',
  title = '💰Pawnshop💰',
  options = {
    {
        title = 'Sell Iphone',
        onSelect = function(args)
          local count = exports.ox_inventory:Search('count', ss.ItemTable[1].item)
          if count > 0 then
              TriggerServerEvent('warehouse:server:sellIphone')
              lib.showContext('sell_openmenu')
          else
              lib.notify({
                  title = 'ERROR!',
                  description = 'Do not have the required item!',
                  type = 'error'
              })
              lib.showContext('sell_openmenu')
          end
        end,
    },
    {
      title = 'Sell Samsung Phone',
      onSelect = function(args)
        local count = exports.ox_inventory:Search('count', ss.ItemTable[2].item)
        if count > 0 then
            TriggerServerEvent('warehouse:server:sellSamsungPhone')
            lib.showContext('sell_openmenu')
        else
            lib.notify({
                title = 'ERROR!',
                description = 'Do not have the required item!',
                type = 'error'
            }) 
            lib.showContext('sell_openmenu')
        end
      end,
    },
    {
      title = 'Sell Laptop',
      onSelect = function(args)
        local count = exports.ox_inventory:Search('count', ss.ItemTable[3].item)
        if count > 0 then
            TriggerServerEvent('warehouse:server:sellLaptop')
            lib.showContext('sell_openmenu')
        else
            lib.notify({
                title = 'ERROR!',
                description = 'Do not have the required item!',
                type = 'error'
            }) 
            lib.showContext('sell_openmenu')
        end
      end,
    },
    {
      title = 'Sell Tablet',
      onSelect = function(args)
        local count = exports.ox_inventory:Search('count', ss.ItemTable[4].item)
        if count > 0 then
            TriggerServerEvent('warehouse:server:sellTablet')
            lib.showContext('sell_openmenu')
        else
            lib.notify({
                title = 'ERROR!',
                description = 'Do not have the required item!',
                type = 'error'
            }) 
            lib.showContext('sell_openmenu')
        end
      end,
    },
    {
      title = 'Sell Samsung TV',
      onSelect = function(args)
        local count = exports.ox_inventory:Search('count', ss.ItemTable[5].item)
        if count > 0 then
            TriggerServerEvent('warehouse:server:sellTV')
            lib.showContext('sell_openmenu')
        else
            lib.notify({
                title = 'ERROR!',
                description = 'Do not have the required item!',
                type = 'error'
            }) 
            lib.showContext('sell_openmenu')
        end
      end,
    },
  },
})
