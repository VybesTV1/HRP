Config.Locations =  {
    ["Centres"] = {
        ["RecycleNorth"] = {
            Enable = true,
            Job = nil,
            Blip = {
                blipEnable = true,
                name = "Recycle Center",
                coords = vector4(57.76, 6470.24, 31.43, 228.33),
                blipTrue = true,
                sprite = 365,
                col = 2,
                model = `G_M_M_ChemWork_01`,
                scenario = "WORLD_HUMAN_CLIPBOARD",
            },
            JobLocations = {
                Enter = { coords = vec4(55.55, 6472.18, 30.43, 44.0), w = 1, d = 4, tele = vec4(1072.87, -3102.52, -39.0, 88.85) },
                Exit = { coords = vec4(1073.0, -3102.49, -40.0, 266.61), w = 1, d = 4, tele = vec4(55.6, 6472.05, 31.43, 223.95) },
                Duty = { coords = vector4(1048.47, -3100.73, -39.18, 270.81), w = 0.5, d = 0.5, },
                Trade = {
                    { coords = vector4(1048.36, -3097.48, -39.0, 270.3), w = 1.0, d = 1.0, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
                },

                Trolly = { coords = vector4(1049.82, -3095.22, -40.0, 191.88), prop = "ex_Prop_Crate_Closed_BC" },
            },
            Zone = {
                vec2(1048.12, -3111.27),
                vec2(1047.72, -3093.55),
                vec2(1074.02, -3093.66),
                vec2(1073.61, -3111.58)
            },
            SearchLocations = {
                vec4(1067.68, -3095.57, -39.9, 180.0),
                vec4(1065.20, -3095.57, -39.9, 180.0),
                vec4(1062.73, -3095.57, -39.9, 180.0),
                vec4(1060.37, -3095.57, -39.9, 180.0),
                vec4(1057.95, -3095.57, -39.9, 180.0),
                vec4(1055.58, -3095.57, -39.9, 180.0),
                vec4(1053.09, -3095.57, -39.9, 180.0),

                vec4(1053.07, -3102.62, -39.9, 0.0),
                vec4(1055.49, -3102.62, -39.9, 180.0),
                vec4(1057.93, -3102.62, -39.9, 0.0),
                vec4(1060.19, -3102.62, -39.9, 180.0),
                vec4(1062.71, -3102.62, -39.9, 0.0),
                vec4(1065.19, -3102.62, -39.9, 180.0),
                vec4(1067.46, -3102.62, -39.9, 0.0),

                vec4(1067.69, -3109.71, -39.9, 0.0),
                vec4(1065.13, -3109.71, -39.9, 0.0),
                vec4(1062.70, -3109.71, -39.9, 0.0),
                vec4(1060.24, -3109.71, -39.9, 0.0),
                vec4(1057.76, -3109.71, -39.9, 0.0),
                vec4(1055.52, -3109.71, -39.9, 0.0),
                vec4(1053.16, -3109.71, -39.9, 0.0),
            },
            ExtraPropLocations = { },
        },
    },
    ['Recycle'] = {
        { coords = vec4(744.68, -1401.77, 26.55, 248.73),
            Ped = { model = "G_M_M_ChemWork_01", scenario = "WORLD_HUMAN_CLIPBOARD", },
            Blip = { blipEnable = false, name = "Recycle Buyer", sprite = 642, col = 2, },
        },
    },
    ['BottleBanks'] = {

    },
}