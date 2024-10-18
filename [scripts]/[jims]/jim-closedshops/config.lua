-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false, -- Debugging mode
	Lan = "en", -- Set locale file here
	img = "qb-inventory/html/images/", -- Set this to get correct "buying menu" images

	Inv = "qb", -- set to "qb" if using qb_inventory
				-- set to "ox" if using ox_nventory
	Menu = "qb",
	Notify = "qb",
	ProgressBar = "qb", -- set to "ox" if using ox_lib progressbar

	Renewed = true, -- If "false" use qb-management, if "true" use Renewed-Banking

	Shops = {
		['beanmachine'] = {
			enable = true,
			locations = {
				[1] = vec4(114.78, -1035.18, 29.34, 70.0), -- Gabz Legion
				[2] = vec4(279.37, -963.97, 29.4, 359.31), -- Legion
				[3] = vec4(-627.41, 245.46, 81.78, 88.46), -- Vinewood
			},
			--ped = "A_F_Y_Hipster_02",
			prop = "prop_vend_coffe_01",
			itemlist = {
				--Drinks
				['highnoon'] = 100,
				['speedball'] = 100,
				['gunkaccino'] = 100,
				['bratte'] = 100,
				['flusher'] = 100,
				['ecocoffee'] = 100,
				['caffeagra'] = 100,
				['bigfruit'] = 100,
			},
		},
		['burgershot'] = {
			enable = true,
			locations = {
				[1] = vec4(-1187.05, -876.65, 13.75, 32.0),
			},
			ped = "U_M_Y_BurgerDrug_01",
			--prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['bscoke'] = 100,
				['milkshake'] = 100,
				--Food
				['heartstopper'] = 100,
				['shotfries'] = 100,
				['shotnuggets'] = 100,
				['shotrings'] = 100,
				['moneyshot'] = 100,
				['meatfree'] = 100,
				['bleeder'] = 100,
				['torpedo'] = 100,
				['cheesewrap'] = 100,
				['chickenwrap'] = 100,
			},
		},
		['catcafe'] = {
			enable = true,
			locations = {
				[1] = vec4(-579.49, -1070.62, 22.33, 180.0),
			},
			--ped = "A_F_Y_Hipster_02",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['bobatea'] = 100,
				['bbobatea'] = 100,
				['gbobatea'] = 100,
				['obobatea'] = 100,
				['pbobatea'] = 100,
				['mocha'] = 100,
				--Food
				['bmochi'] = 100,
				['gmochi'] = 100,
				['omochi'] = 100,
				['pmochi'] = 100,
				['riceball'] = 100,
				['bento'] = 100,
				['purrito'] = 100,
				['nekocookie'] = 100,
				['nekodonut'] = 100,
				['cake'] = 100,
				['cakepop'] = 100,
				['pancake'] = 100,
				['pizza'] = 100,
				['miso'] = 100,
				['ramen'] = 100,
				['noodlebowl'] = 100,
			},
		},
		['henhouse'] = {
			enable = true,
			locations = {
				[1] = vec4(-296.48, 6259.31, 31.49, 255.0),
			},
			--ped = "S_M_M_AmmuCountry",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['tillie'] = 100,
				['b52'] = 100,
				['brussian'] = 100,
				['bkamikaze'] = 100,
				['cappucc'] = 100,
				['ccookie'] = 100,
				['iflag'] = 100,
				['kamikaze'] = 100,
				['sbullet'] = 100,
				['voodoo'] = 100,
				['woowoo'] = 100,
				--Food
				['friedpick'] = 100,
				['maccheese'] = 100,
				['bplate'] = 100,
				['cplate'] = 100,
				['splate'] = 100,
				['rplate'] = 100,
				['nplate'] = 100,
				['wings'] = 100,
			},
		},
		['pizzathis'] = {
			enable = true,
			locations = {
				[1] = vec4(793.6, -742.23, 27.27, 90.0),
			},
			--ped = "S_M_Y_Chef_01",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Food
				['capricciosabox'] = 100,
				['diavolabox'] = 100,
				['marinarabox'] = 100,
				['margheritabox'] = 100,
				['prosciuttiobox'] = 100,
				['vegetarianabox'] = 100,
				['bolognese'] = 100,
				['calamari'] = 100,
				['meatball'] = 100,
				['alla'] = 100,
				['pescatore'] = 100,
			},
		},
		['popsdiner'] = {
			enable = true,
			locations = {
				[1] = vec4(1577.99, 6458.41, 25.32, 157.0),
			},
			--ped = "S_M_Y_Chef_01",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Food
				['baconeggs'] = 100,
				['bltsandwich'] = 100,
				['cheeseburger'] = 100,
				['cheesesandwich'] = 100,
				['eggsandwich'] = 100,
				['grilledwrap'] = 100,
				['hamburger'] = 100,
				['hamcheesesandwich'] = 100,
				['hamsandwich'] = 100,
				['ranchwrap'] = 100,
				['sausageeggs'] = 100,
				['steakburger'] = 100,
				['toastbacon'] = 100,
				['tunasandwich'] = 100,
				['veggiewrap'] = 100,
			},
		},
		['tequilala'] = {
			enable = true,
			locations = {
				[1] = vec4(-562.61, 274.47, 83.02, 172.0),
			},
			--ped = "A_F_Y_Hipster_02",
			prop = "prop_vend_snak_01",
			itemlist = {
				['b52'] = 100,
				['brussian'] = 100,
				['bkamikaze'] = 100,
				['cappucc'] = 100,
				['ccookie'] = 100,
				['iflag'] = 100,
				['kamikaze'] = 100,
				['sbullet'] = 100,
				['voodoo'] = 100,
				['woowoo'] = 100,
			},
		},
		['vanilla'] = {
			enable = true,
			locations = {
				[1] = vec4(129.87, -1305.12, 29.22, 216.0),
			},
			--ped = "CSB_Stripper_02",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['amarettosour'] = 100,
				['bellini'] = 100,
				['cosmopolitan'] = 100,
				['longisland'] = 100,
				['margarita'] = 100,
				['pinacolada'] = 100,
				['sangria'] = 100,
				['screwdriver'] = 100,
				['strawdaquiri'] = 100,
				['strawmargarita'] = 100,
				--Food
				['vusliders'] = 100,
				['vutacos'] = 100,
				['nplate'] = 100,
				['tots'] = 100,
			},
		},
		['bakery'] = {
			enable = true,
			locations = {
				[1] = vec4(49.42, -134.08, 55.46, 160.14),
			},
			ped = "S_M_Y_Chef_01",
			--prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['milkshake'] = 100,
				['strawberrymilkshake'] = 100,
				['chocolatemilkshake'] = 100,
				--Food
				['tbcake'] = 100,
				['tbchoccake'] = 100,
				['tbbirthdaycake'] = 100,
				['tbcookie'] = 100,
				['tbcupcake'] = 100,
				['tbsweetroll'] = 100,
				['tbdonut'] = 100,
				['tblongjohn'] = 100,
				['tbcroissant'] = 100,
				['tbchoccroiss'] = 100,
			},
		},
	},
}


Core = exports["qb-core"]:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() Core = exports["qb-core"]:GetCoreObject() end)

Loc = {}