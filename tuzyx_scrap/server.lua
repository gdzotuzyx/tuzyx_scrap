local ESX = exports["es_extended"]:getSharedObject()

lib.callback.register('tuzyx_script:getPoliceCount', function(source)
    local players = ESX.GetExtendedPlayers('job', 'police')
    return #players
end)

RegisterNetEvent('tuzyx_script:giveReward', function(itemName, min, max)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local amount = math.random(min or 1, max or 1)

    -- Using the export to give the item
    local success = exports.ox_inventory:AddItem(src, itemName, amount)
    
    if success then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Success',
            description = 'Found ' .. amount .. 'x ' .. itemName,
            type = 'success'
        })
    end
end)