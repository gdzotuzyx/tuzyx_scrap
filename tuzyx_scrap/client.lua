local function startScavenging(data)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    -- 1. Police Check
    lib.callback('tuzyx_script:getPoliceCount', false, function(policeCount)
        if policeCount < Config.RequiredPolice then
            lib.notify({ title = 'Error', description = 'Not enough police!', type = 'error' })
            return
        end

        -- 2. Progress Bar
        if lib.progressBar({
            duration = 3000,
            label = 'Searching...',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { scenario = 'CODE_HUMAN_MEDIC_TEND_TO_NEXT' },
        }) then
            -- 3. Minigame
            local success = lib.skillCheck({'easy', 'medium', 'medium'}, {'e'})

            if success then
                -- 4. Dispatch (Only on success + % chance)
                if math.random(1, 100) <= (Config.DispatchChance or 30) then
                    local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                    local streetLabel = GetStreetNameFromHashKey(var1)
                    
                    TriggerServerEvent('cd_dispatch:AddNotification', {
                        job_table = {'police'},
                        coords = coords,
                        title = '10-17 - Podivna aktivita u scrapyardu',
                        message = 'Aktivita u' .. streetLabel,
                        flash = 0,
                        unique_id = tostring(math.random(1111, 9999)),
                        blip = { sprite = 458, scale = 1.2, color = 1, flags = 1, label = 'Theft', time = 60 }
                    })
                end

                -- 5. Give Reward
                TriggerServerEvent('tuzyx_script:giveReward', data.item, data.minAmount, data.maxAmount)
            else
                lib.notify({ title = 'Failed', description = 'You found nothing.', type = 'error' })
            end
        end
        ClearPedTasks(playerPed)
    end)
end

CreateThread(function()
    Wait(1000)
    for i, site in ipairs(Config.Locations) do
        -- We use addBoxZone which creates the interaction area
        exports.ox_target:addBoxZone({
            coords = site.coords,
            size = vec3(site.length, site.width, site.maxZ - site.minZ),
            rotation = site.heading,
            debug = false, -- Keep true until the menu pops up
            options = {
                {
                    name = site.name or "scavenge_"..i,
                    icon = 'fa-solid fa-wrench',
                    label = site.label,
                    onSelect = function()
                        startScavenging(site)
                    end
                }
            }
        })
    end
end)