## 1.8.1
	-Remove money function fixed
## 1.9
	-medicalbag & medicinebox exploit fixed
## 2.0
	-new stretcher prop
	-replaced prop converted to addon prop
	-stretcher/wheelchair to bed glitch fixed
## 2.0.1
	-stretcher offset fixed for qb-target
## 2.1
	-stretcher heading adjustment for transport vehicle
## 2.1.1
	-Add patient to bed target error fixed
## 2.2
	-character switch bug fixed
	-add society money fixed
## 2.3
	-skellyfix synced
## 2.4
	-Disable force respawn button when enough ems available
	-Block qs-inventory when player dead
## 2.5
	-morphine10 fixed
## 2.5.1
	-send back to jail after revive
## 2.6
	-checkin distance increased
## 2.7
	-DisableDeadControls() call has been fixed
## 2.7.1
	-ls-arcade support added
## 2.8
	-saline add health fixed
## 2.9
	-multiple job supported
## 3.0
	-saline will add food, water and remove stress
## 3.1
	-down log webhook fixed
	Replace:  
		=> modules/death/server/log.lua
## 3.2
	-ak47_qb_ambulancejob:onForceRespawn added
	Replace:  
		=> modules/death/client/death.lua
		=> modules/death/client/customizable.lua
## 3.2.1
    -management export error fixed
    Replace:
        => utils/server.lua
## 3.2.2
    -old qb-management support added
    Replace:
        => config.lua
        => utils/server.lua
## 3.3
    -stress relieve function fixed
    -revive or checkin will give 100% food, water and relieve 100% stress
## 3.4
    -combat log auto respawn added
    -combat log punishment added
    Replace:  
		=> config.lua
		=> modules/main/client/main.lua
		=> modules/main/server/main.lua
## 3.4.1
    -combat log punishment error fixed
    Replace:
		=> modules/main/server/main.lua
## 3.5
    -player will get hold E option after brain dead 
    Replace:  
		=> modules/death/client/death.lua
## 3.6
    -m-Insurance support added
    Replace:  
		=> modules/main/server/main.lua
		=> utils/server.lua
## 3.7
    -bug after brain dead fixed
    Replace:  
		=> modules/death/client/death.lua
		=> locales/en.lua
## 3.8
    -applybandage translation fixed
    Replace:  
		=> modules/skelly/client/treatment.lua
		=> locales/en.lua
## 3.8.1
    -duty checker added
    Replace:  
		=> utils/client.lua
## 3.9
    -combat log auto respawn fixed
    Replace:  
		=> modules/main/client/main.lua
## 3.9.1
    -utils/client.lua error fixed
    Replace:  
		=> utils/client.lua
## 4.0
    -codem-apperance support added
    Replace:  
		=> modules/wardrobe/config.lua
		=> modules/wardrobe/client/wardrobe.lua
## 4.1
    -crawl movement added when down
    Replace:  
		=> config.lua
		=> modules/death/client/dead.lua
## v4.2
    -ak47_qb_vehiclekeys support added
    Replace:  
        => modules/vehicle/client/customizable.lua
        => modules/vehicle/client/vehicle.lua
## v4.2.1
    -job error fixed in the server console
    Replace:  
        => modules/checkin/server/checkin.lua
## v4.3
    -Config.AutoRespawnAfterBrainDead is now functional
    Replace:  
        => modules/death/client/dead.lua
## v4.4
    -mute dead player
    Replace:  
        => config.lua
        => modules/main/server/main.lua
## v4.5
    -mute dead player mumble error fixed
    Replace:  
        => modules/death/client/customizable.lua
        => modules/main/server/main.lua
## v4.6
    -back to server side to fix mute dead player
    Replace:  
        => modules/death/client/customizable.lua
        => modules/main/server/main.lua
## v4.7
    -auto crutch after checkin (require ak47_qb_crutch)
    Replace:  
        => config.lua
        => modules/checkin/client/customizable.lua
## v4.8
    -GetSkellyDamages export added (check documentation)
    Replace:  
        => modules/skelly/client/skelly.lua
## v4.8.1
    -evidence:server:CreateBloodDrop event support added for chest bleeding
    Replace:  
        => utils/client.lua
        => modules/skelly/client/skelly.lua
## v4.9
    -negative balance support in checking
    Replace:  
        => modules/checkin/config.lua
        => modules/checkin/client/checkin.lua
        => utils/server.lua
## v5.0
    -dead player will stay inside the vehicle
    Replace:  
        => modules/death/client/dead.lua
## v5.1
    -discord log fixed
    Replace:  
        => webhooks.lua
        => modules/death/client/log.lua
## v5.2
    -delete transport ambulance, npc adjusted
    -give firstaid & medikit to patient with target option
    Replace:  
        => config.lua
        => locales/en.lua
        => modules/death/client/dead.lua
        => modules/skelly/client/kit.lua
        => modules/skelly/client/treatment.lua
        => modules/skelly/server/skelly.lua
## v5.3
    -object management improved
    Replace:  
        => modules/medicalbag/client/medicalbag.lua
        => modules/medicinebox/client/medicinebox.lua
        => modules/saline/client/saline.lua
        => modules/saline/server/saline.lua
        => modules/stretcher/client/streature.lua
        => modules/wheelchair/client/wheelchair.lua
## v5.4
    - cause of damage added
    Replace:  
        => locales/en.lua
        => modules/death/config.lua
        => modules/skelly/client/kit.lua
        => modules/skelly/client/skelly.lua
        => modules/skelly/client/treatment.lua
## v5.5
    - Config.KeepDeadPlayerInsideVehicle added
    Replace:  
        => config.lua
        => modules/death/client/dead.lua
## v5.6
    - fail safe added if script fails to take screenshot
    Replace:  
        => modules/death/client/log.lua
## v5.7
    - error fix if script fails to take screenshot. Will prevent death screen freeze
    Replace:  
        => modules/death/client/log.lua