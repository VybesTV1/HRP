Config.ClothingScript = 'auto' --Auto detect or ['ak47_clothing', 'qb-clothing','raid_clothes','rcore_clothes','illenium-appearance', 'codem-apperance', onex-creation]

Config.Lockers = {
	{
		zone 		= vector3(300.26, -598.66, 43.28),  		--zone position
		rotation 	= 160.0,									--zone rotation
		size 		= vector3(4.0, 3.0, 2.0),					--zone size
	},
}

Config.Preset = { --only supported with ak47_clothing or qb-clothing
	{
		Name = 'Outfit 1',
		JobGrades = {
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
			[8] = true,
		},
		SkinData = { -- skin value will be different in your server. You have to adjust
			male = {
				['arms'] = {item = 85, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 129, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 250, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 58, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 127, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 96, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 54, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = 122, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			},
			female = {
				['arms'] = {item = 109, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 159, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 258, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 66, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 97, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 99, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 55, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			}
		}
	},

	{
		Name = 'Outfit 2',
		JobGrades = {
			[1] = true,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
			[8] = true,
		},
		SkinData = { -- skin value will be different in your server. You have to adjust
			male = {
				['arms'] = {item = 90, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 15, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 249, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 57, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 126, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 96, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 54, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = 122, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			},
			female = {
				['arms'] = {item = 105, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 13, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 257, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 65, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 96, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 99, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 55, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = 121, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			}
		}
	},

	{
		Name = 'Outfit 3',
		JobGrades = {
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
			[8] = true,
		},
		SkinData = { -- skin value will be different in your server. You have to adjust
			male = {
				['arms'] = {item = 93, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 32, texture = 3, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 31, texture = 7, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 126, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 28, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 10, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = -1, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			},
			female = {
				['arms'] = {item = 105, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                ['t-shirt'] = {item = 39, texture = 3, defaultItem = 0, defaultTexture = 0}, -- T-Shirt
                ['torso2'] = {item = 7, texture = 1, defaultItem = 0, defaultTexture = 0}, -- Jackets
                ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Vest
                ['decals'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Decals
                ['accessory'] = {item = 96, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck
                ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                ['pants'] = {item = 34, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Pants
                ['shoes'] = {item = 29, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Shoes
                ['mask'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Mask
                ['hat'] = {item = -1, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Hat
                ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                ['ear'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Ear accessories
			}
		}
	},
}