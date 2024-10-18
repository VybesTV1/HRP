Config.Pharmacy = {
    -- pillbox upstairs
    {
        PedPosition = vector4(323.96, -583.53, 43.27, 155.39),
        PedModel = 's_m_m_doctor_01',
        items = {
            {
                name = 'medicalbag',
                label = 'Medical Bag',
                description = 'Contains all necessary medical equipment', --any description
                price = 250,
                rank = 0, --minimum job rank
            },
            {
                name = 'medicinebox',
                label = 'Medicine Box',
                description = 'Contains all necessary medicines',
                price = 150,
                rank = 0, --minimum job rank
            },
        },
    },
    -- pillbox downstairs
    {
        PedPosition = vector4(353.95, -587.46, 28.80, 336.61),
        PedModel = 's_m_m_doctor_01',
        items = {
            {
                name = 'medicalbag',
                label = 'Medical Bag',
                description = 'Contains all necessary medical equipment', --any description
                price = 250,
                rank = 0, --minimum job rank
            },
            {
                name = 'medicinebox',
                label = 'Medicine Box',
                description = 'Contains all necessary medicines',
                price = 1015000,
                rank = 0, --minimum job rank
            },
        },
    },
}