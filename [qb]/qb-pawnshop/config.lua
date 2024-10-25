Config = {}

Config.img = "qb-inventory/html/images/" -- Images location in your inventory
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendMeltingEmail = true -- send email when melting is ready ?
Config.ShowNotOwnedItems = false -- true = Show all items that can be sold, false = Show only owned items

Config.PawnLocation = {
    [1] = {
        coords = vector3(412.34, 314.81, 103.13),
        length = 1.0,
        width = 1.0,
        heading = 207.0,
        debugPoly = false,
        distance = 3.0,
        ped = 'a_f_y_soucent_01',
        enablemelting = false, -- is melting available at this location ?
        showblip = true,
        items = {
            [1] = {item = 'goldchain', price = math.random(25,45)},
            [2] = {item = 'diamond_ring', price = math.random(25,45)},
            [3] = {item = 'rolex', price = math.random(25,45)},
            [4] = {item = '10kgoldchain', price = math.random(25,45)},
            [5] = {item = 'art1', price = math.random(25,45)},
            [6] = {item = 'art2', price = math.random(25,45)},
            [7] = {item = 'art3', price = math.random(25,45)},
            [8] = {item = 'art4', price = math.random(25,45)},
            [9] = {item = 'art5', price = math.random(25,45)},
            [10] = {item = 'art6', price = math.random(25,45)},
            [11] = {item = 'art7', price = math.random(25,45)},
            [12] = {item = 'checkbook', price = math.random(25,45)},
            [13] = {item = 'mdlaptop', price = math.random(25,45)},
            [14] = {item = 'mddesktop', price = math.random(25,45)},
            [15] = {item = 'mdmonitor', price = math.random(25,45)},
            [16] = {item = 'mdtablet', price = math.random(25,45)},
            [17] = {item = 'mdspeakers', price = math.random(25,45)},
        }
    },
}

Config.MeltingItems = { -- meltTime is amount of time in minutes per item
    [1] = {
        item = 'goldchain',
        rewards = {
            [1] = {item = 'goldbar', amount = 2}
        },
        meltTime = 0.15
    },
    [2] = {
        item = 'diamond_ring',
        rewards = {
            [1] = {item = 'diamond', amount = 1},
            [2] = {item = 'goldbar', amount = 1}
        },
        meltTime = 0.15
    },
    [3] = {
        item = 'rolex',
        rewards = {
            [1] = {item = 'diamond', amount = 1},
            [2] = {item = 'goldbar', amount = 1},
            [3] = {item = 'electronickit', amount = 1}
        },
        meltTime = 0.15
    },
    [4] = {
        item = '10kgoldchain',
        rewards = {
            [1] = {item = 'diamond', amount = 5},
            [2] = {item = 'goldbar', amount = 1}
        },
        meltTime = 0.15
    },
}
