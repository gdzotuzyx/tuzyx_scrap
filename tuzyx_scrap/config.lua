Config = {}

Config.DispatchChance = 30 -- Percentage chance (0-100)
Config.RequiredPolice = 1  -- Minimum police needed to start scavenging

Config.Locations = {
    {
        name = "search_scrap_1",
        label = "Search Scrap",
        coords = vec3(-473.12, -1702.39, 19.06),
        length = 1.5, width = 1.5, heading = 0.0,
        minZ = 18.0, maxZ = 20.5,
        item = "scrap",
        minAmount = 2,
        maxAmount = 5
    },
    {
        name = "search_pipes_1",
        label = "Search Pipes",
        coords = vec3(-453.9515, -1727.6365, 18.6888),
        length = 1.5, width = 1.5, heading = 0.0,
        minZ = 17.6, maxZ = 20.1,
        item = "pipe",
        minAmount = 1,
        maxAmount = 1
    },
    {
        name = "search_springs_1",
        label = "Search Springs",
        coords = vec3(-443.66, -1676.58, 20.03),
        length = 1.5, width = 1.5, heading = 0.0,
        minZ = 19.0, maxZ = 21.5,
        item = "spring",
        minAmount = 1,
        maxAmount = 1
    },
    {
        name = "search_smg_body_1",
        label = "Search Weapon Body",
        coords = vec3(-414.89, -1675.26, 20.01),
        length = 1.5, width = 1.5, heading = 0.0,
        minZ = 19.0, maxZ = 21.5,
        item = "smg_body",
        minAmount = 1,
        maxAmount = 1
    },
    {
        name = "search_rifle_body_1",
        label = "Search Weapon Body",
        coords = vec3(-454.7307, -1679.9584, 19.1966),
        length = 1.5, width = 1.5, heading = 0.0,
        minZ = 18.3, maxZ = 20.8,
        item = "rifle_body",
        minAmount = 1,
        maxAmount = 1
    }
}