box1 = false
box2 = false
box3 = false
box4 = false
box5 = false
box6 = false

exports['qb-target']:AddBoxZone("warehouse1", vector3(719.25, -2101.69, 29.24), 0.7, 0.5, {
    name="warehouse1",
    heading=0,
    minZ = 28.3,
    maxZ = 30.5,
    debugpoly = false,
  }, {
    options = {
        {
            type = "client",
            event = "warehouse:EnterLocation",
            icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
            label = "Rewire Electrical System",
        },
    },
    distance = 2.5,
})

exports['qb-target']:AddBoxZone("warehouse2", vector3(1087.18, -3099.36, -39.0), 1.4, 0.5, {
  name="warehouse2",
  heading=0,
  minZ = -40.3,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:ExitDoor",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Exit",
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box1", vector3(1088.79, -3096.72, -40.0), 2.0, 2.0, {
  name="box1",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box1 = true
          end,
          canInteract = function()
              if box1 == false then
                  return true
              else
                  return false
              end
          end,
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box2", vector3(1091.31, -3096.72, -40.0), 2.0, 2.0, {
  name="box2",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box2 = true
          end,
          canInteract = function()
              if box2 == false then
                  return true
              else
                  return false
              end
          end,
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box3", vector3(1095.22, -3096.64, -40.0), 2.0, 2.0, {
  name="box3",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box3 = true
          end,
          canInteract = function()
              if box3 == false then
                  return true
              else
                  return false
              end
          end,
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box4", vector3(1101.31, -3096.64, -40.0), 2.0, 2.0, {
  name="box4",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box4 = true
          end,
          canInteract = function()
              if box4 == false then
                  return true
              else
                  return false
              end
          end,
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box5", vector3(1103.89, -3096.87, -40.0), 2.0, 2.0, {
  name="box5",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box5 = true
          end,
          canInteract = function()
              if box5 == false then
                  return true
              else
                  return false
              end
          end,
      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("box6", vector3(1097.75, -3096.82, -40.0), 2.0, 2.0, {
  name="box6",
  heading=0,
  minZ = -40.0,
  maxZ = -35.5,
  debugpoly = false,
}, {
  options = {
      {
          type = "client",
          event = "warehouse:client:target:pickupPackage",
          icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
          label = "Look for Valuble Items",
          action = function()
            TriggerEvent("warehouse:client:target:pickupPackage")
            box6 = true
          end,
          canInteract = function()
              if box6 == false then
                  return true
              else
                  return false
              end
          end,

      },
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("warehousepolice", vector3(719.2, -2102.8, 29.24), 1.4, 1, {
  name = "warehousepolice",
  heading = 354,
  debugPoly = false, 
  minZ = 24.7,
  maxZ = 35.9,
}, {
  options = { 
    { 
      type = "client", 
      event = "warehouse:EnterDoor", 
      icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket', 
      label = 'Break Open Door', 
      job = 'police',
    }
  },
  distance = 2.5,
})

exports['qb-target']:AddBoxZone("sellelectronics", vector3(-658.74, -855.38, 24.49), 1.2, 1, {
  name = "sellelectronics",
  heading = 270,
  debugPoly = false, 
  minZ = 24.0,
  maxZ = 26.9,
}, {
  options = { 
    { 
      type = "client", 
      event = "warehouse:openMenu", 
      icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket', 
      label = 'Sell Electronics', 
    }
  },
  distance = 2.5,
})