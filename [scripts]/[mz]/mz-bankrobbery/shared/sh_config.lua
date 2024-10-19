Config = Config or {}

-------------------------
--DEPENDENCY PROPERTIES--
-------------------------

    Config.CoreEx = 'qb-core'
    Config.TargetEx = 'qb-target'
    Config.UIEx = 'ps-ui'
    Config.DispatchEx = 'ps-dispatch'

------------------
--MZ-BANKROBBERY--
------------------

    Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-------------------------
--GENERAL CONFIGURATION--
-------------------------

    Config.UseDefaultRangeChecks = true                     -- Change to "false" if this is causing errors because of different MLO usage (such as if you use gabz for banks and have not reset the coorindates) 

    Config.NotifyType = "qb"                              -- Change to 'qb' for standard qb-core notification; Change to 'okok' for okokNotify notifications.

    Config.psdispatch = true                                -- Change to "false" to disable ps-dispatch alerts.
-- if "Config.psdispatch = true", then the following applies: 
    Config.NewVersion = true                                -- Set to "false" if you are using ps-dispatch v1. Set to true if you are using ps-dispatch v2

    Config.skillcheck = false                                -- Set this to "false" to disable the use of skillchecks in mz-bankrobbery

    Config.IgnoreThermiteUsage = true                       -- Set to "false" to allow thermite usage with powerplants (not necessary for mz-bankrobbery so keep disabled if you are not using the powerplant function for anything else)

    Config.mzskills = false                                  -- Set to "false" to disable mz-skills XP integration with "Hacking" and "Heist Reputation"
--if "Config.mzskills = true", then: 
    Config.CriminalXPSkill = "Heist Reputation"             -- You can change the name of the Criminal XP skill (but make sure it is the same as mz-skills/config.lua)
    Config.CrimXPlvl8 = 12800
    Config.CrimXPlvl7 = 6400
    Config.CrimXPlvl6 = 3200
    Config.CrimXPlvl5 = 1600
    Config.CrimXPlvl4 = 800
    Config.CrimXPlvl3 = 400
    Config.CrimXPlvl2 = 200
    Config.CrimXPlvl1 = 100
    Config.CrimXPlvl0 = 0

    Config.HackingXPSkill = "Hacking"                       -- You can change the name of the Hacking XP skill (but make sure it is the same as mz-skills/config.lua)
    Config.HackXPlvl8 = 12800
    Config.HackXPlvl7 = 6400
    Config.HackXPlvl6 = 3200
    Config.HackXPlvl5 = 1600
    Config.HackXPlvl4 = 800
    Config.HackXPlvl3 = 400
    Config.HackXPlvl2 = 200
    Config.HackXPlvl1 = 100
    Config.HackXPlvl0 = 0

---------------------
--POLICE PARAMETERS--
---------------------

    Config.MinimumFleecaPolice = 0                         -- Minimum number of police which need to be on duty for Fleeca banks to be robbable.

    Config.MinimumPaletoPolice = 0                          -- Minimum number of police which need to be on duty for the Paleto bank to be robbable. 

    Config.MinimumPacificPolice = 0                         -- Minimum number of police which need to be on duty for the Pacific bank to be robbable.

-- For multiple police job names please change the following using the same formatting, otherwise leave things as they are):

    Config.PoliceJob1 = "police"
    Config.PoliceJob2 = "police"
    Config.PoliceJob3 = "police"

    Config.MinimumThermitePolice = 0                        -- Minimum number of police which need to be on duty to disable powerplant.

    Config.OutlawCooldown = 5                               -- The amount of minutes it takes for the cops to be able to be called again after they were called

----------
--OUTPUT--
----------

    Config.DirtyPayout = "markedbills"                       -- Change to "dirtymoney" to use dirtymoney, "cash" to use ordinary cash or "markedbills" for markedbills.

    Config.RewardTypes = {
        [1] = {
            type = "item"
        },
        [2] = {
            type = "money"
        }
    }

    Config.HeistBreakChance = 10                            -- Percentage chance for required item to break upon failed skillcheck

    Config.LoseExplosive = 25                               -- Chance (in percentage) for the player to lose thermite when failing ps-ui:thermite

----------------
--PACIFIC BANK--
----------------

    Config.PacificBankFirstDoor = "advancedlockpick"        -- Item necessary to be able to lockpick the first locked door (ps-ui:circle)

    Config.PacificFirstDoor = "Fleeca-Pac1"                 -- First locked door name (do not touch if using the Fleeca.lua config)

    Config.PacificBankVerifyClearance = "security_card_02"  -- Item necessary to enter bank system and pass second locked door.

    Config.PacificBankInternalDoorClear = "security_card_02" -- For the internal door down to the lower level.

    Config.PacTrojan = "trojan_usb"

    Config.PacElectronic = "electronickit"

    Config.ExplosiveItem = "thermite"

    Config.VerificationFailChance = 25                      -- Chance of above item removing if skillcheck failed.

    Config.PacificBankOverrideSecurity = "usb4"             -- Item necessary to be able to bypass security system before pacific bank vault

    Config.OverrideFailChance = 25                          -- Chance of above item removing if skillcheck failed.

    Config.PacificLockBoxItem = "drill"                     -- Item player needs to get into Pacific Bank lock boxes

    Config.VaultDoors = {
        {x = 252.63,    y = 220.8,      z = 101.68,  h = 162.13},
        {x = 261.6,     y = 215.36,     z = 101.68,  h = 248.91},
    }

    Config.FirstVaultInnerDoor = "Fleeca-Vault1"           -- First vault locked door name (do not touch if using the Fleeca.lua config)

    Config.FirstVaultSecondDoor = "Fleeca-Vault2"          -- Second vault locked door name (do not touch if using the Fleeca.lua config)

-- PACIFIC BANK OUTPUT VARIABLES PER LOCKBOX (10 in total)
    Config.PacificPayoutLow = 7500                         -- Lowest amount of currency given per Pacific Bank lockbox
    Config.PacificPayoutHigh = 12500                       -- Highest amount of currency given per Pacific Bank lockbox
    Config.RareWeaponPacific1 = "weapon_minismg"           -- Rare weapon (25% chance rarity if weapon drops)
    Config.RareWeaponPacific2 = "weapon_heavypistol"       -- Rare weapon (75% chance rarity if weapon drops)

--Reward Rarity -- PLEASE NOTE: Tier chances must add to 100.
    Config.Tier1Chance = 55                                 -- Percentage chance for player to obtain lowest tier of reward.
    Config.Tier2Chance = 25                                 -- Percentage chance for player to obtain second lowest tier of reward.
    Config.Tier3Chance = 15                                 -- Percentage chance for player to obtain second highest tier of reward.
    Config.Tier4Chance = 5                                  -- Percentage chance for player to obtain highest tier of reward.

    Config.LockerRewardsPacific = {                        -- Pacific bank loot table.
        ["tier1"] = {
            [1] = {item = "goldbar", minAmount = 2, maxAmount = 8},
        },
        ["tier2"] = {
            [1] = {item = "goldbar", minAmount = 2, maxAmount = 8},
        },
        ["tier3"] = {
            [1] = {item = "goldbar", minAmount = 2, maxAmount = 8},
        },
    }

--TIME TO DRILL THROUGH LOCKBOX DECRASES WITH MORE "Heist Reputation" XP, AS FOLLOWS:
    Config.lvl0timePac = 24
    Config.lvl1timePac = 22
    Config.lvl2timePac = 20
    Config.lvl3timePac = 18
    Config.lvl4timePac = 16
    Config.lvl5timePac = 14
    Config.lvl6timePac = 13
    Config.lvl7timePac = 12
    Config.lvl8timePac = 10
-- if "Config.mzskills = false" then the following value is the number of seconds it will take a player to get into a lockbox:
    Config.NOXPtimePac = 20

-----------------------------
--PACIFIC BANK SKILL CHECKS--
-----------------------------

--------------------------
--OPEN FIRST LOCKED DOOR--
--------------------------

-- if Config.mzskills = true, then the following parameters apply:

-- “Heist Reputation” Level 0 
    Config.pacheistparseslvl0 = 10                 -- Number of parses of ps-ui circle at “Heist Reputation” level 0.
    Config.pacheisttimelvl0 = 5                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 0.
-- “Heist Reputation” Level 1 
    Config.pacheistparseslvl1 = 9                  -- Number of parses of ps-ui circle at “Heist Reputation” level 1.
    Config.pacheisttimelvl1 = 6                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 1.
-- “Heist Reputation” Level 2 
    Config.pacheistparseslvl2 = 9                  -- Number of parses of ps-ui circle at “Heist Reputation” level 2.
    Config.pacheisttimelvl2 = 7                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 2.
-- “Heist Reputation” Level 3 
    Config.pacheistparseslvl3 = 8                  -- Number of parses of ps-ui circle at “Heist Reputation” level 3.
    Config.pacheisttimelvl3 = 7                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 3.
-- “Heist Reputation” Level 4 
    Config.pacheistparseslvl4 = 8                  -- Number of parses of ps-ui circle at “Heist Reputation” level 4.
    Config.pacheisttimelvl4 = 8                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 4.
-- “Heist Reputation” Level 5 
    Config.pacheistparseslvl5 = 8                  -- Number of parses of ps-ui circle at “Heist Reputation” level 5.
    Config.pacheisttimelvl5 = 9                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 5.
-- “Heist Reputation” Level 6 
    Config.pacheistparseslvl6 = 7                  -- Number of parses of ps-ui circle at “Heist Reputation” level 6.
    Config.pacheisttimelvl6 = 8                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 6.
-- “Heist Reputation” Level 7 
    Config.pacheistparseslvl7 = 6                  -- Number of parses of ps-ui circle at “Heist Reputation” level 7.
    Config.pacheisttimelvl7 = 9                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 7.
-- “Heist Reputation” Level 8 
    Config.pacheistparseslvl8 = 5                  -- Number of parses of ps-ui circle at “Heist Reputation” level 8.
    Config.pacheisttimelvl8 = 8                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 8.
-- if Config.mzskills = false and Config.skillcheck = true, then the following parameters apply:
    Config.pacheistparsesNOXP = 7                  -- Number of parses of ps-ui circle at “Heist Reputation” level 8.
    Config.pacheisttimelNOXP = 8                   -- Time to complete ps-ui circle parses at “Heist Reputation” level 8.

-------------------
--VERIFY SECURITY--
-------------------

-- if Config.mzskills = true, then the following parameters apply: 

-- "Hacking" Level 0 
    Config.stypelvl0 = "alphabet"			-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 0.
    Config.ssecondslvl0 = 17 				-- Time (in seconds) to complete the hack at "Hacking" level 0.
    Config.smodifylvl0 = 0				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 0.
-- "Hacking" Level 1 
    Config.stypelvl1 = "alphabet"			-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 1.
    Config.ssecondslvl1 = 15 				-- Time (in seconds) to complete the hack at "Hacking" level 1.
    Config.smodifylvl1 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 1.
-- "Hacking" Level 2 
    Config.stypelvl2 = "numeric"			-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 2.
    Config.ssecondslvl2 = 16 				-- Time (in seconds) to complete the hack at "Hacking" level 2.
    Config.smodifylvl2 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 2.
-- "Hacking" Level 3 
    Config.stypelvl3 = "numeric"			-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 3.
    Config.ssecondslvl3 = 14 				-- Time (in seconds) to complete the hack at "Hacking" level 3.
    Config.smodifylvl3 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 3.
-- "Hacking" Level 4 
    Config.stypelvl4 = "alphanumeric"		-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 4.
    Config.ssecondslvl4 = 16 				-- Time (in seconds) to complete the hack at "Hacking" level 4.
    Config.smodifylvl4 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 4.
-- "Hacking" Level 5 
    Config.stypelvl5 = "alphanumeric"		-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 5.
    Config.ssecondslvl5 = 14 				-- Time (in seconds) to complete the hack at "Hacking" level 5.
    Config.smodifylvl5 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 5.
-- "Hacking" Level 6 
    Config.stypelvl6 = "greek"		        -- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 6.
    Config.ssecondslvl6 = 16 				-- Time (in seconds) to complete the hack at "Hacking" level 6.
    Config.smodifylvl6 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 6.
-- "Hacking" Level 7 
    Config.stypelvl7 = "greek"		        -- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 7.
    Config.ssecondslvl7 = 14 				-- Time (in seconds) to complete the hack at "Hacking" level 7.
    Config.smodifylvl7 = 1				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 7.
-- "Hacking" Level 8 
    Config.stypelvl8 = "runes"		        -- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 8.
    Config.ssecondslvl8 = 14 				-- Time (in seconds) to complete the hack at "Hacking" level 8.
    Config.smodifylvl8 = 2			        -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 8.

-- if "Config.mzskills = false", then the following parameters apply: 
    Config.stypeNOXP = "alphanumeric"		-- Set to: alphabet, numeric, alphanumeric, greek, braille or runes for "Hacking" level 8.
    Config.ssecondsNOXP = 14 				-- Time (in seconds) to complete the hack at "Hacking" level 8.
    Config.smodifyNOXP = 2				    -- Complexity variable, set to "0" for Normal, "1" for Normal + Mirrored or "2" for Mirrored only for "Hacking" level 8.

----------------------------------------------------------------------------------------------------------------------------------

---------------
--PALETO BANK--
---------------

    Config.PaletoBankClear = "security_card_01"         -- Required item to get past vault door

    Config.PaletoBankLockBox = "drill"                  -- Required item to get into Paleto bank lock boxes

    Config.PaletoBankInnerDoor = "advancedlockpick"     -- Item required to breach inner door of bank

    Config.LetoInnerDoor = "Fleeca-Leto"                -- No need to change (Name of Inner Door for Paleto bank robbery)

-- OUTPUT
    Config.PaletoPayoutLow = 5000                       -- Lowest amount of currency given per Paleto lockbox
    Config.PaletoPayoutHigh = 7500                      -- Highest amount of currency given per Paleto lockbox
    Config.RareLootLeto = "security_card_02"            -- Rare loot drop from Paleto Bank   
    Config.RareWeaponLeto = "weapon_pistol50"           -- Rare weapon drop from Paleto Bank

    Config.LockerRewardsPaleto = {                      -- Paleto bank loot table.
        ["tier1"] = {
            [1] = {item = "goldchain", minAmount = 10, maxAmount = 20},
        },
        ["tier2"] = {
            [1] = {item = "rolex", minAmount = 10, maxAmount = 20},
        },
        ["tier3"] = {
            [1] = {item = "goldbar", minAmount = 2, maxAmount = 4},
        },
    }

------------------------------------
--START SAFE DOOR BREACH - PALETO --
------------------------------------

-- if "Config.mzskills = true", then the following parameters apply:

-- MZ-SKILLS - "HEIST REPUTATION" XP MODIFIERS
    Config.HeistXPlowLeto = 1                   -- Lowest amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPmidLeto = 2                   -- Middle amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPhighLeto = 3                  -- Highest amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPlossLeto = 2                  -- “Heist Reputation” XP lost for failing a breach.
-- “Heist Reputation” Level 0 
    Config.heistgridsizelvl0 = 9                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl0 = 4                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl0 = 1                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 1 
    Config.heistgridsizelvl1 = 9                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl1 = 4                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl1 = 1                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 2 
    Config.heistgridsizelvl2 = 8                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl2 = 5                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl2 = 1                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 3 
    Config.heistgridsizelvl3 = 5                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl3 = 5                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl3 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 4 
    Config.heistgridsizelvl4 = 7                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl4 = 5                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl4 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 5 
    Config.heistgridsizelvl5 = 6                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl5 = 6                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl5 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 6 
    Config.heistgridsizelvl6 = 6                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl6 = 7                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl6 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 7 
    Config.heistgridsizelvl7 = 6                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl7 = 6                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl7 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- “Heist Reputation” Level 8 
    Config.heistgridsizelvl8 = 6                -- Gridsize re: ps-ui thermite
    Config.heisttimelvl8 = 6                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorlvl8 = 2                   -- Number of errors a player can make re: ps-ui thermite
-- if "Config.mzskills = false" and "Config.skillcheck = true", then the following parameters apply:
    Config.heistgridsizeNOXP = 5                -- Gridsize re: ps-ui thermite
    Config.heisttimeNOXP = 7                    -- Time to memorise pattern re: ps-ui thermite
    Config.heisterrorNOXP = 1                   -- Number of errors a player can make re: ps-ui thermite

--TIME TO DRILL THROUGH LOCKBOX DECRASES WITH MORE "Heist Reputation" XP, AS FOLLOWS:
    Config.lvl0timeLeto = 24
    Config.lvl1timeLeto = 22
    Config.lvl2timeLeto = 20
    Config.lvl3timeLeto = 18
    Config.lvl4timeLeto = 16
    Config.lvl5timeLeto = 14
    Config.lvl6timeLeto = 12
    Config.lvl7timeLeto = 10
    Config.lvl8timeLeto = 8
-- if "Config.mzskills = false" then the following value is the number of seconds it will take a player to get into a lockbox:
    Config.NOXPtimeLeto = 20

--------------------------------------------------------------------------------------------------------------------------------------------------

----------------
--FLEECA BANKS--
----------------

    Config.FleecaBreachItem1 = "trojan_usb"             -- Can be set to any item

    Config.FleecaBreachItem2 = "electronickit"          -- Please note, this item must be capable of being used from your inventory because it is what triggers the start of the relevant breach.

    Config.FleecaSafeBreak = "blowtorch"                -- Item player needs to search through internal lockboxes once front of safe has been breached.

    Config.FleecaInnerDoors = "usb4"                    -- Item needed to attempt to open internal bank doors

-- FLEECA BANK OUTPUT VARIABLES PER LOCKBOX (10 in total)
    Config.FleecaPayoutLow = 3000                       -- Lowest amount of currency given per Fleeca lockbox
    Config.FleecaPayoutHigh = 5000                      -- Highest amount of currency given per Fleeca lockbox
    Config.RareLoot = "security_card_01"                -- Rare loot drop from Fleeca Banks
    Config.RareLootWeapon = "weapon_pistol"             -- Rare weapon drop from Fleeca Bank

    Config.LockerRewards = {
        ["tier1"] = {
            [1] = {item = "goldchain", minAmount = 5, maxAmount = 15},
        },
        ["tier2"] = {
            [1] = {item = "rolex", minAmount = 5, maxAmount = 15},
        },
        ["tier3"] = {
            [1] = {item = "goldbar", minAmount = 1, maxAmount = 2},
        },
    }

--------------------------
--START SAFE DOOR BREACH--
--------------------------

---------------------------------------------
--MZ-SKILLS (OPEN FRONT SAFE DOOR MHACKING)--
---------------------------------------------

-- if "Config.mzskills = true", then the following parameters apply:

-- MZ-SKILLS - HACKING XP MODIFIERS
    Config.HackingXPlow = 5					-- Lowest amount of "Hacking" XP added for a successful hack.
    Config.HackingXPmid = 7					-- Middle amount of "Hacking" XP added for a successful hack.
    Config.HackingXPhigh = 9				-- Highest amount of "Hacking" XP added for a successful hack.
    Config.HackingXPloss = 7				-- "Hacking" XP lost for failing a hack.

-- "Hacking" Level 0 
    Config.lowhacklvl0 = 5					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 0.
    Config.highhacklvl0 = 5 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 0.
    Config.hacktimelvl0 = 13				-- Time given to match in mhacking at "Hacking" level 0.
-- "Hacking" Level 1 
    Config.lowhacklvl1 = 4					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 1.
    Config.highhacklvl1 = 5 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 1.
    Config.hacktimelvl1 = 14				-- Time given to match in mhacking at "Hacking" level 1.
-- "Hacking" Level 2 
    Config.lowhacklvl2 = 4					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 2.
    Config.highhacklvl2 = 5 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 2.
    Config.hacktimelvl2 = 15				-- Time given to match in mhacking at "Hacking" level 2.
-- "Hacking" Level 3 
    Config.lowhacklvl3 = 4					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 3.
    Config.highhacklvl3 = 4 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 3.
    Config.hacktimelvl3 = 16				-- Time given to match in mhacking at "Hacking" level 3.
-- "Hacking" Level 4 
    Config.lowhacklvl4 = 3					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 4.
    Config.highhacklvl4 = 4 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 4.
    Config.hacktimelvl4 = 17				-- Time given to match in mhacking at "Hacking" level 4.
-- "Hacking" Level 5 
    Config.lowhacklvl5 = 3					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 5.
    Config.highhacklvl5 = 4 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 5.
    Config.hacktimelvl5 = 18				-- Time given to match in mhacking at "Hacking" level 5.
-- "Hacking" Level 6 
    Config.lowhacklvl6 = 3					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 6.
    Config.highhacklvl6 = 3 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 6.
    Config.hacktimelvl6 = 19				-- Time given to match in mhacking at "Hacking" level 6.
-- "Hacking" Level 7 
    Config.lowhacklvl7 = 2					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 7.
    Config.highhacklvl7 = 3 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 7.
    Config.hacktimelvl7 = 20				-- Time given to match in mhacking at "Hacking" level 7.
-- "Hacking" Level 8 
    Config.lowhacklvl8 = 2					-- Lowest number of alphanumeric items to match in mhacking at "Hacking" level 8.
    Config.highhacklvl8 = 3 				-- Highest number of alphanumeric items to match in mhacking at "Hacking" level 8.
    Config.hacktimelvl8 = 20				-- Time given to match in mhacking at "Hacking" level 8.

-- if "Config.mzskills = false", then the following parameters apply for all hacks:  
    Config.lowhack = 3                      -- Lowest number of alphanumeric items to match in mhacking where Config.mzskills = false. 
    Config.highhack = 4                     -- Highest number of alphanumeric items to match in mhacking where Config.mzskills = false. 
    Config.hacktime = 15                    -- Time given to match in mhacking where Config.mzskills = false.

---------------------------
--FLEECA (OPEN LOCKBOXES)--
---------------------------

-- if Config.mzskills = true, then the following parameters apply:

-- MZ-SKILLS - "HEIST REPUTATION" XP MODIFIERS
    Config.HeistXPlow = 1                 -- Lowest amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPmid = 2                 -- Middle amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPhigh = 3                -- Highest amount of “Heist Reputation” XP added for a successful breach.
    Config.HeistXPloss = 2                -- “Heist Reputation” XP lost for failing a breach.
-- “Heist Reputation” Level 0 
    Config.heistparseslvl0 = 7                  -- Number of parses of ps-ui circle at “Heist Reputation” level 0.
    Config.heisttimelvl0 = 7                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 0.
-- “Heist Reputation” Level 1 
    Config.heistparseslvl1 = 6                  -- Number of parses of ps-ui circle at “Heist Reputation” level 1.
    Config.heisttimelvl1 = 7                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 1.
-- “Heist Reputation” Level 2 
    Config.heistparseslvl2 = 6                  -- Number of parses of ps-ui circle at “Heist Reputation” level 2.
    Config.heisttimelvl2 = 8                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 2.
-- “Heist Reputation” Level 3 
    Config.heistparseslvl3 = 5                  -- Number of parses of ps-ui circle at “Heist Reputation” level 3.
    Config.heisttimelvl3 = 8                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 3.
-- “Heist Reputation” Level 4 
    Config.heistparseslvl4 = 5                  -- Number of parses of ps-ui circle at “Heist Reputation” level 4.
    Config.heisttimelvl4 = 9                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 4.
-- “Heist Reputation” Level 5 
    Config.heistparseslvl5 = 4                  -- Number of parses of ps-ui circle at “Heist Reputation” level 5.
    Config.heisttimelvl5 = 9                    -- Time to complete ps-ui circle parses at “Heist Reputation” level 5.
-- “Heist Reputation” Level 6 
    Config.heistparseslvl6 = 4                  -- Number of parses of ps-ui circle at “Heist Reputation” level 6.
    Config.heisttimelvl6 = 10                   -- Time to complete ps-ui circle parses at “Heist Reputation” level 6.
-- “Heist Reputation” Level 7 
    Config.heistparseslvl7 = 3                  -- Number of parses of ps-ui circle at “Heist Reputation” level 7.
    Config.heisttimelvl7 = 10                   -- Time to complete ps-ui circle parses at “Heist Reputation” level 7.
-- “Heist Reputation” Level 8 
    Config.heistparseslvl8 = 2                  -- Number of parses of ps-ui circle at “Heist Reputation” level 8.
    Config.heisttimelvl8 = 10                   -- Time to complete ps-ui circle parses at “Heist Reputation” level 8.
-- if Config.mzskills = false and Config.skillcheck = true, then the following parameters apply:
    Config.heistparsesNOXP = 6                  -- Number of parses of ps-ui circle at “Heist Reputation” level 8.
    Config.heisttimelNOXP = 8                   -- Time to complete ps-ui circle parses at “Heist Reputation” level 8.

--TIME TO BLOWTORCH THROUGH LOCKBOX DECRASES WITH MORE "Heist Reputation" XP, as follows:
    Config.lvl0time = 24
    Config.lvl1time = 22
    Config.lvl2time = 20
    Config.lvl3time = 18
    Config.lvl4time = 16
    Config.lvl5time = 14
    Config.lvl6time = 12
    Config.lvl7time = 10
    Config.lvl8time = 8
-- if "Config.mzskills = false" then the following value is the number of seconds it will take a player to get into a lockbox:
    Config.NOXPtime = 20

-- After breaking into a lockbox a player will need to steal the valuables inside from it (i.e. the following is additional time the player will have to wait):

-- STEAL FROM LOCKBOX (Time to take loot from lockbox)
    Config.StealTimeLow = 6                      -- Lowest time (in seconds) to steal from Fleeca lockbox.
    Config.StealTimeHigh = 9                     -- Highest time (in seconds) to steal from Fleeca lockbox.

-------------------------
--MZ-SKILLS - HACKING 2-- - Hack to open internal Fleeca bank doors
-------------------------

    Config.InnerConsoleLow = 6                   -- Lowest time (in seconds) to install inner console overdrive device.
    Config.InnerConsoleHigh = 12                 -- Highest time (in seconds) to install inner console overdrive device.

-- if "Config.mzskills = true", then the following parameters apply:

-- NOTE: MZ-SKILLS - “Hacking” XP modifiers are the same for the front terminal hack as they are for the inner doors breach. See "HACKING XP MODIFIERS" above.

-- “Hacking” Level 0 
    Config.varhackParseslvl0 = 6                  -- Number of parses of ps-ui circle at “Hacking” level 0.
    Config.varhackTimelvl0 = 3                    -- Time to complete ps-ui circle parses at “Hacking” level 0.
-- “Hacking” Level 1 
    Config.varhackParseslvl1 = 6                  -- Number of parses of ps-ui circle at “Hacking” level 1.
    Config.varhackTimelvl1 = 4                    -- Time to complete ps-ui circle parses at “Hacking” level 1.
-- “Hacking” Level 2 
    Config.varhackParseslvl2 = 5                  -- Number of parses of ps-ui circle at “Hacking” level 2.
    Config.varhackTimelvl2 = 4                    -- Time to complete ps-ui circle parses at “Hacking” level 2.
-- “Hacking” Level 3 
    Config.varhackParseslvl3 = 5                  -- Number of parses of ps-ui circle at “Hacking” level 3.
    Config.varhackTimelvl3 = 5                    -- Time to complete ps-ui circle parses at “Hacking” level 3.
-- “Hacking” Level 4 
    Config.varhackParseslvl4 = 4                  -- Number of parses of ps-ui circle at “Hacking” level 4.
    Config.varhackTimelvl4 = 5                    -- Time to complete ps-ui circle parses at “Hacking” level 4.
-- “Hacking” Level 5 
    Config.varhackParseslvl5 = 4                  -- Number of parses of ps-ui circle at “Hacking” level 5.
    Config.varhackTimelvl5 = 7                    -- Time to complete ps-ui circle parses at “Hacking” level 5.
-- “Hacking” Level 6 
    Config.varhackParseslvl6 = 3                  -- Number of parses of ps-ui circle at “Hacking” level 6.
    Config.varhackTimelvl6 = 5                    -- Time to complete ps-ui circle parses at “Hacking” level 6.
-- “Hacking” Level 7 
    Config.varhackParseslvl7 = 3                  -- Number of parses of ps-ui circle at “Hacking” level 7.
    Config.varhackTimelvl7 = 7                    -- Time to complete ps-ui circle parses at “Hacking” level 7.
-- “Hacking” Level 8 
    Config.varhackParseslvl8 = 2                  -- Number of parses of ps-ui circle at “Hacking” level 8.
    Config.varhackTimelvl8 = 5                    -- Time to complete ps-ui circle parses at “Hacking” level 8.

-- if "Config.mzskills = false" and "Config.skillcheck = true", then the following parameters apply:
    Config.varhackParsesNOXP = 7                  -- Number of parses of ps-ui circle if mz-skills is disabled.
    Config.varhackTimelNOXP = 8                   -- Time to complete ps-ui circle parses if mz-skills is disabled.

-- if "Config.skillcheck = false" then there will be no skill check but the progressbars will occur.

-------------------------------------------------

--- This is called whenever an item check occursS
---
--- Accepted formats for `items`:
--- ```lua
--- 'itemName'
---
--- {'item1', 'item2', 'etc'}
---
--- {['item1'] = amount, ['item2'] = 2, ['etc' = 5]} -- the amount here is the amount needed of that item, if the amount variable is defined when this format is used, the amount variable will be prioritized
--- ```
--- @param items table | array | string
--- @param amount number | nil
--- @return boolean
function Config.HasItem(items, amount)
    return QBCore.Functions.HasItem(items, amount)
end

Config.PowerStations = {
    [1] = {
        coords = vector3(2835.24, 1505.68, 24.72),
        hit = false
    },
    [2] = {
        coords = vector3(2811.76, 1500.6, 24.72),
        hit = false
    },
    [3] = {
        coords = vector3(2137.73, 1949.62, 93.78),
        hit = false
    },
    [4] = {
        coords = vector3(708.92, 117.49, 80.95),
        hit = false
    },
    [5] = {
        coords = vector3(670.23, 128.14, 80.95),
        hit = false
    },
    [6] = {
        coords = vector3(692.17, 160.28, 80.94),
        hit = false
    },
    [7] = {
        coords = vector3(2459.16, 1460.94, 36.2),
        hit = false
    },
    [8] = {
        coords = vector3(2280.45, 2964.83, 46.75),
        hit = false
    },
    [9] = {
        coords = vector3(2059.68, 3683.8, 34.58),
        hit = false
    },
    [10] = {
        coords = vector3(2589.5, 5057.38, 44.91),
        hit = false
    },
    [11] = {
        coords = vector3(1343.61, 6388.13, 33.4),
        hit = false
    },
    [12] = {
        coords = vector3(236.61, 6406.1, 31.83),
        hit = false
    },
    [13] = {
        coords = vector3(-293.1, 6023.54, 31.54),
        hit = false
    }
}

Config.SmallBanks = {
    [1] = {
        ["label"] = "Vinewood",
        ["coords"] = vector3(311.15, -284.49, 54.16),
        ["alarm"] = true,
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 21,
        ["isOpened"] = false, 
        ["insideBars"] = {
            ["coords"] = vector3(312.9, -284.67, 54.14),
            ["z"] = 54.14,
            ["h"] = 159.13,
            ["Door"] = "Fleeca-1",
            ["isOpened"] = false
        },       
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(310.88, -287.57, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(311.51, -286.08, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(313.34, -289.44, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(311.61, -288.73, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(314.61, -288.87, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(315.15, -287.44, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(315.24, -284.85, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(314.08, -283.38, 54.14),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    [2] = {
        ["label"] = "Legion Square",
        ["coords"] = vector3(146.92, -1046.11, 29.36),
        ["alarm"] = true,
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 22,
        ["isOpened"] = false,
        ["insideBars"] = {
            ["coords"] = vector3(148.58, -1046.3, 29.35),
            ["z"] = 29.35,
            ["h"] = 158.22,
            ["Door"] = "Fleeca-2",
            ["isOpened"] = false
        },     
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(149.84, -1044.9, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(151.16, -1046.64, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(147.16, -1047.72, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(146.54, -1049.28, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(146.88, -1050.33, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(150.0, -1050.67, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(149.47, -1051.28, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(150.58, -1049.09, 29.34),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    [3] = {
        ["label"] = "Hawick Ave",
        ["coords"] = vector3(-353.82, -55.37, 49.03),
        ["alarm"] = true,
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 23,
        ["isOpened"] = false,
        ["insideBars"] = {
            ["coords"] = vector3(-352.13, -55.41, 49.01),
            ["z"] = 49.01,
            ["h"] = 162.28,
            ["Door"] = "Fleeca-3",
            ["isOpened"] = false
        },  
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-350.99, -54.13, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(-349.53, -55.77, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(-353.54, -56.94, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(-354.09, -58.55, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(-353.81, -59.48, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(-349.8, -58.3, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(-351.14, -60.37, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(-350.4, -59.92, 49.01),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    [4] = {
        ["label"] = "Del Perro Blvd",
        ["coords"] = vector3(-1210.77, -336.57, 37.78),
        ["alarm"] = true,
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 296.863,
            open = 206.863
        },
        ["camId"] = 24,
        ["isOpened"] = false,
        ["insideBars"] = {
            ["coords"] = vector3(-1209.42, -335.46, 37.76),
            ["z"] = 37.76,
            ["h"] = 205.19,
            ["Door"] = "Fleeca-4",
            ["isOpened"] = false
        },  
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-1209.68, -333.65, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(-1207.46, -333.77, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(-1209.45, -337.47, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(-1208.65, -339.06, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(-1207.75, -339.42, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(-1205.28, -338.14, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(-1205.08, -337.28, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(-1205.92, -335.75, 37.75),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    [5] = {
        ["label"] = "Great Ocean Hwy",
        ["coords"] = vector3(-2956.55, 481.74, 15.69),
        ["alarm"] = true,
        ["object"] = `hei_prop_heist_sec_door`,
        ["heading"] = {
            closed = 357.542,
            open = 267.542
        },
        ["camId"] = 25,
        ["isOpened"] = false,
        ["insideBars"] = {
            ["coords"] = vector3(-2956.85, 483.42, 15.68),
            ["z"] = 15.68,
            ["h"] = 265.21,
            ["Door"] = "Fleeca-5",
            ["isOpened"] = false
        },  
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-2958.54, 484.1, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(-2957.3, 485.95, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(-2955.09, 482.43, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(-2953.26, 482.42, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(-2952.63, 483.09, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(-2952.45, 485.66, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(-2953.13, 486.26, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(-2954.98, 486.37, 15.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    [6] = {
        ["label"] = "East",
        ["coords"] = vector3(1175.96, 2712.87, 38.09),
        ["alarm"] = true,
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = -270.542,
            open = -370.542
        },
        ["camId"] = 25,
        ["isOpened"] = false,
        ["insideBars"] = {
            ["coords"] = vector3(1174.34, 2712.48, 38.07),
            ["z"] = 38.07,
            ["h"] = 355.14,
            ["Door"] = "Fleeca-6",
            ["isOpened"] = false
        },  
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(1173.69, 2710.76, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(1171.78, 2711.94, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(1175.25, 2714.51, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(1175.26, 2715.97, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(1174.27, 2716.83, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(1172.32, 2716.82, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(1171.25, 2716.08, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(1171.23, 2714.44, 38.07),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    }
}

Config.BigBanks = {
    ["paleto"] = {
        ["label"] = "Blaine County Savings Bank",
        ["coords"] = vector3(-105.61, 6472.03, 31.62),
        ["alarm"] = true,
        ["object"] = -1185205679,
        ["heading"] = {
            closed = 45.45,
            open = 130.45
        },
        ["thermite"] = {
            [1] = {
                ["coords"] = vector3(-106.11, 6475.36, 31.62),
                ["isOpened"] = false,
                ["doorId"] = 5
            }
        },
        ["camId"] = 26,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-107.4, 6473.87, 31.62),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(-107.66, 6475.61, 31.62),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(-103.52, 6475.03, 31.62),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(-102.3, 6476.13, 31.66),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(-102.43, 6477.45, 31.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(-103.97, 6478.97, 31.62),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(-105.39, 6479.19, 31.67),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(-106.57, 6478.01, 31.62),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    },
    ["pacific"] = {
        ["label"] = "Pacific Standard",
        ["coords"] = {
            [1] = vector3(261.95, 223.11, 106.28),
            [2] = vector3(253.25, 228.44, 101.68)
        },
        ["alarm"] = true,
        ["object"] = 961976194,
        ["heading"] = {
            closed = 160.00001,
            open = 70.00001
        },
        ["thermite"] = {
            [1] = {
                ["coords"] = vector3(252.55, 221.15, 101.68),
                ["isOpened"] = false,
                ["doorId"] = 2
            },
            [2] = {
                ["coords"] = vector3(261.15, 215.21, 101.68),
                ["isOpened"] = false,
                ["doorId"] = 3
            }
        },
        ["camId"] = 26,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(258.57, 218.36, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [2] = {
                ["coords"] = vector3(260.82, 217.62, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [3] = {
                ["coords"] = vector3(259.33, 213.76, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [4] = {
                ["coords"] = vector3(257.09, 214.55, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [5] = {
                ["coords"] = vector3(263.7, 216.48, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [6] = {
                ["coords"] = vector3(265.81, 215.81, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [7] = {
                ["coords"] = vector3(266.43, 214.37, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [8] = {
                ["coords"] = vector3(265.71, 212.49, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [9] = {
                ["coords"] = vector3(264.24, 211.92, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            },
            [10] = {
                ["coords"] = vector3(262.21, 212.67, 101.68),
                ["isBusy"] = false,
                ["isOpened"] = false
            }
        }
    }
}

Config.Shooters = {
    ['soldiers'] = {
        locations = {
            [1] = {                         -- Pacific Bank Security
                peds = {vector3(260.19, 223.26, 101.68),
                vector3(263.48, 219.03, 101.68),
                vector3(265.87, 224.23, 102.45),
                vector3(265.95, 221.34, 101.68)}
            },
        },
    }
}
Config.PedGun = 'weapon_pistol'             -- Defence weapon used by spawn.
