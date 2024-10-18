Config.DisableCheckinWhenOnlineEms = 1
Config.CheckInWithLowBalance = false
Config.CheckIn = {
    --pillbox upstairs
    {
        PedPosition = vector4(311.63, -594.1, 43.28, 339.31), --last value is heading
        PedModel = 's_m_m_doctor_01',
        Time = 5, --seconds
        Price = 2000,
        Beds = {
            {pos = vector4(314.42, -584.31, 43.2, 340.0)},
            {pos = vector4(317.66, -585.41, 43.2, 340.0)},
            {pos = vector4(311.03, -582.95, 43.2, 340.0)},
            {pos = vector4(319.3, -580.99, 43.2, 160.0)},
            {pos = vector4(313.89, -578.84, 43.2, 160.0)},
        },
    },
    ---pillbox downstairs
    {
        PedPosition = vector4(339.42, -583.80, 28.80, 249.85),
        PedModel = 's_m_m_doctor_01',
        Time = 5, --seconds
        Price = 2000,
        Beds = {
            {pos = vector4(314.42, -584.31, 43.2, 340.0)},
            {pos = vector4(317.66, -585.41, 43.2, 340.0)},
            {pos = vector4(311.03, -582.95, 43.2, 340.0)},
            {pos = vector4(319.3, -580.99, 43.2, 160.0)},
            {pos = vector4(313.89, -578.84, 43.2, 160.0)},
        },
    },
}