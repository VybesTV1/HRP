Config = {}
Config.Inv = 'qb'
Config.Target = 'qb' -- qb, ox or interact
Config.Defaultslot = 50
Config.Defaultweight = 1000000

Config.Objects = {
    {value = 'tr_prop_tr_chest_01a', label = 'Chest 1'},
    {value = 'prop_champ_box_01', label = 'Chest 2'},
    {value = 'prop_box_wood05a', label = 'Chest 3'}
}
--[[
    OPTIONALS
    job = "jobname"
    gang = "gangname"
    rank = 0 ( if no rank in code, defaults to 0 for job/gang)
    weight = 100000
    slots = 50
    item = 'item'
    cid = 'citizenID'
    password = 1234 ( must be number between 1 and 99999)
    REQUIRED
    loc = vector3

]]
Config.stash = { ------ outdated dont use if you are downloading new, this is meant for previous users that can use a command to inject this data to the SQL
    ['queenbee'] = { loc = vector3(2708.25, 3493.59, 55.67), job = "queenbee"},

}