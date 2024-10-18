Config = {}

-- TARGET CONFIG
Config.target = 'luck-contextmenu' -- qb-target, ox-target, qtarget, luck-contextmenu

Config.menu = true -- for no user target, set true for active menu set Config.target false for no target
Config.menuTextControl = '~g~Appuyez sur E pour ouvrir le menu'
Config.menuTextSit = '~g~Appuyez sur E pour vous coucher'

Config.TargetLabelStop = 'Finir la radio'
Config.TargetLabelStart = 'Lancer la radio'
Config.TargetLabelSit = 'S\'allonger'

Config.KeyLeave = true -- true = players may leave the table at any time | false = players leave the table only when the doctor stops the machine
Config.KeyLeaveTable = 'X' -- Key for players to lower themselves from the table
Config.KeyTextLeaveTable = 'Descendre de la radio' -- Key text visible in FiveM keys

--Camera position
Config.Camera = true
Config.CameraPos = vector4(330.18, -586.77, 39.0, 275)

-- Speed to destination
Config.rotationSpeed = 0.30

-- ON or OFF FlashEffect in IRM
Config.Flash = true

-- Config for Sound IRM
Config.Sound = true
Config.SoundVolume = 0.05
Config.SoundFile = "IRM.mp3"

-- Anim
Config.AnimDict = "anim@gangops@morgue@table@"
Config.AnimName = "body_search"
