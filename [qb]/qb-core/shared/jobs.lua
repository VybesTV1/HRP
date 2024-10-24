QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },
	taxi = { label = 'Taxi', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Recruit', payment = 50 } } },

	police = {
		label = 'Hypnotized Police Department',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'PCSO', payment = 25 },
			['1'] = { name = 'Constable', payment = 50 },
			['2'] = { name = 'Sergeant', payment = 75 },
			['3'] = { name = 'Inspector', payment = 100 },
			['4'] = { name = 'Chief Inspector', payment = 125 },
			['5'] = { name = 'Superintendent', payment = 150 },
			['6'] = { name = 'Chief Superintendent', payment = 175 },
			['7'] = { name = 'Commander', isboss = true, payment = 200 },
			['8'] = { name = 'Deputy Assistant Commissioner', isboss = true, payment = 225 },
			['9'] = { name = 'Assistant Commissioner', isboss = true, payment = 250 },
			['10'] = { name = 'Deputy Commissioner', isboss = true, payment = 275 },
			['11'] = { name = 'Commissioner', isboss = true, payment = 300 },
		},
	},
	ambulance = {
		label = 'UHS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Student Paramedic', payment = 25 },
			['1'] = { name = 'Paramedic', payment = 50 },
			['2'] = { name = 'Doctor', payment = 75 },
			['3'] = { name = 'Experienced Doctor', payment = 100 },
			['4'] = { name = 'Advanced Doctor', payment = 125 },
			['5'] = { name = 'Surgeon', payment = 150 },
			['6'] = { name = 'Experienced Surgeon', payment = 175 },
			['7'] = { name = 'Advanced Surgeon', payment = 200 },
			['8'] = { name = 'Daputy Assistent Director', isboss = true, payment = 225 },
			['9'] = { name = 'Assistant Director', isboss = true, payment = 250 },
			['10'] = { name = 'Deputy Director', isboss = true, payment = 275 },
			['11'] = { name = 'Director', isboss = true, payment = 300 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
		},
	},
	luxdealer = {
		label = 'Luxury Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
		},
	},
	boatdealer = {
		label = 'Boat Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
		},
	},
	queenbee = {
		label = 'Queen Bee Mechanics',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Queen', isboss = true, payment = 150 },
		},
	},
	firefighter = {
		label = 'Hypnotize Fire Department',
		type = 'firefighter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit firefighter', payment = 50 },
			['1'] = { name = 'firefighter', payment = 75 },
			['2'] = { name = 'Experienced firefighter', payment = 100 },
			['3'] = { name = 'Advanced firefighter', payment = 125 },
			['4'] = { name = 'Deputy Chief', isboss = true, payment = 125 },
			['5'] = { name = 'chief', isboss = true, payment = 150 },
		},
	},
	catcafe = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
		},
	},
	henhouse = {
		label = 'Hen House',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
        },
	},
	burgershot = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'owner', isboss = true, payment = 150 },
        },
	},
	fishnchips = {
		label = 'Fish N Chips',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Kitchen Porter', payment = 25 },
            ['1'] = { name = 'Team Member', payment = 50 },
            ['2'] = { name = 'Sales Manager', payment = 75 },
            ['3'] = { name = 'owner', isboss= true, payment = 100 },
			
        },
    },
	icecream = {
		label = 'Polar Ice Cream',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Kitchen Porter', payment = 25 },
            ['1'] = { name = 'Team Member', payment = 50 },
            ['2'] = { name = 'Sales Manager', payment = 75 },
            ['3'] = { name = 'owner', isboss= true, payment = 100 },
        },
	},
}
