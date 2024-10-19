Config.DisableCheckinWhenOnlineEms = 1
Config.CheckInWithLowBalance = false
Config.CheckIn = {
    --pillbox upstairs
    {
        PedPosition = vector4(301.82, -591.08, 43.27, 335.36), --last value is heading
        PedModel = 's_m_m_doctor_01',
        Time = 15, --seconds
        Price = 275,
        Beds = {
            {pos = vector4(323.32, -568.71, 49.11, 160.00)},
            {pos = vector4(319.99, -567.51, 49.11, 160.00)},
            {pos = vector4(316.76, -566.32, 49.11, 160.00)},
            {pos = vector4(314.90, -570.98, 49.11, 340.00)},
            {pos = vector4(318.15, -572.17, 49.11, 340.00)},
        },
    },
    ---pillbox downstairs
    {
        PedPosition = vector4(339.42, -583.80, 28.80, 249.85),
        PedModel = 's_m_m_doctor_01',
        Time = 15, --seconds
        Price = 275,
        Beds = {
            {pos = vector4(301.16, -591.28, 29.70, 250.00)},
            {pos = vector4(299.84, -594.91, 29.70, 250.00)},
            {pos = vector4(298.41, -598.53, 29.70, 250.00)},
            {pos = vector4(297.07, -602.21, 29.70, 250.00)},
        },
    },
}