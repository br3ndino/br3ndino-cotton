local lib = exports.ox_lib
local QBCore = exports['qb-core']:GetCoreObject()

-- Crafting location (textile crafting area)
local craftingLocation = vector3(718.6765, -963.7034, 30.4178)

-- Create the crafting location with qb-target
Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("CraftingLocation", craftingLocation, 1, 1, {
        name="CraftingLocation",
        heading=0,
        debugPoly=false,
        minZ=29.0,
        maxZ=31.0
    }, {
        options = {
            {
                type = "client",
                event = "textile:openCraftingMenu",
                icon = "fas fa-cogs",
                label = "Open Crafting Menu"
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent("textile:openCraftingMenu", function()
    local cottonCount = 0

    -- Access player data
    local playerData = QBCore.Functions.GetPlayerData()

    -- Debug: Print out the entire inventory data
    print("Player Data: " .. json.encode(playerData))

    -- Check if cotton item exists in inventory
    if playerData and playerData.items then
        -- Loop through the items to find cotton
        for _, item in pairs(playerData.items) do
            if item.name == "cotton" then
                cottonCount = item.amount or 0
                break
            end
        end
    end

    -- Debug: Log the cotton count
    print("Cotton Count: " .. cottonCount)

    -- Check if the player has enough cotton to craft
    if cottonCount >= 3 then
        -- Define the crafting options for the context menu
        local options = {
            {
                title = "🧦 Socks",
                description = "Requires 5 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 5, "sock")
                end
            },
            {
                title = "👕 Shirt",
                description = "Requires 10 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 10, "shirt")
                end
            },
            {
                title = "👖 Pants",
                description = "Requires 15 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 15, "pants")
                end
            },
            {
                title = "👜 Purse",
                description = "Requires 20 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 20, "purse")
                end
            },
            {
                title = "👚 Fake Designer Shirt",
                description = "Requires 25 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 25, "fake_shirt")
                end
            },
            {
                title = "👖 Fake Designer Pants",
                description = "Requires 30 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 30, "fake_pants")
                end
            },
            {
                title = "👛 Fake Designer Purse",
                description = "Requires 35 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 35, "fake_purse")
                end
            },
            {
                title = "👮 Fake Police Uniform",
                description = "Requires 40 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 40, "fake_police")
                end
            },
            {
                title = "🩹 Bandaid",
                description = "Requires 50 Cotton",
                onSelect = function()
                    TriggerServerEvent("textile:startCrafting", 50, "bandage")
                end
            },
        }

        -- Show the context menu with ox_lib:registerContext
        exports.ox_lib:registerContext({
            id = "textile_menu",
            title = "Textile Crafting",
            options = options
        })

        -- Open the context menu
        exports.ox_lib:showContext("textile_menu")
    else
        QBCore.Functions.Notify("You don't have enough cotton!", "error")
    end
end)

-- Show progress bar on crafting
RegisterNetEvent("textile:showCraftingProgress", function()
    print("Progress bar triggered")  -- Debugging line to check if the event is fired
    exports['progressbar']:Progress({
        name = "Sewing Cotton",
        duration = 5000,
        label = "Sewing Cotton",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missmechanic",
            anim = "work2_base",
        },
        prop = {},
        propTwo = {}
    }, function(cancelled)
    if not cancelled then
        print("Not cancelled")
    else
        print("Cancelled")
    end
end)
end)


RegisterNetEvent("textile:itemCrafted", function(itemToCraft)
    print("Item crafted: " .. itemToCraft)  -- Debugging line to ensure the item is crafted
    -- Notify the player and update inventory
    QBCore.Functions.Notify("You crafted 1 " .. itemToCraft, "success")
end)
