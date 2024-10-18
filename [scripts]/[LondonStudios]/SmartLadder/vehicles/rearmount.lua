-- 1 = X
-- 2 = Y
-- 3 = Z

-- to define if prop rotates or moves, use:
-- if rotation, add:

rearmount = {
    model = `rearmount`,
    name = "REARMOUNT",
    controlToOperate = {73, "INPUT_VEH_DUCK"},
    pedAttachment = {
        id = "LadderSeat",
        offSet = {-0.8, -0.4, 1.07},
        rotation = {0.0, 0.0, 0.0},
    },
    drawRotation = true,
    animation = {
        enabled = true,
        idle = {
            dict = "amb@world_human_stand_guard@male@base",
            name = "base"
        },
        
    },
    water = {
        enabled = true,
        control = {0, 101},
        locations = {
            ["Cage"] = {
                {
                    scale = 1.0,
                    asset = "core",
                    name = "water_cannon_jet",
                    offSet = {0.33, 1.25, 0.45},
                    rotation = {-10.0, 0.0, 0.0},
                },
                {
                    scale = 1.0,
                    asset = "core",
                    name = "water_cannon_jet",
                    offSet = {-0.33, 1.25, 0.45},
                    rotation = {-10.0, 0.0, 0.0},
                },
            },
        }
    },
    cage = {
        enabled = true,
        id = "Cage",
        offSet = {0.0, 0.6, 1.03},
        rotation = {0.0, 0.0, 0.0},
    }, 
    data = {
        {
            id = "LadderSeat",
            model = `rearmount_seat`,
            isLadder = false,
            attachTo = "vehicle",
            boneIndex = "", -- If attaching to vehicle
            defaultOffSet = {0.0, -4.31, 0.79},
            offSet = {0.0, -4.31, 0.79},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = false,
            minimumOffSet = {0.0, 0.0, 0.0},
            maxOffSet = false,
            maximumOffSet = {0.0, 0.0, 0.0},
            controls = {
                [63] = {
                    movementType = "rotate",
                    axis = 3,
                    movementAmount = 0.1,
                },
                [64] = {
                    movementType = "rotate",
                    axis = 3,
                    movementAmount = -0.1,
                },
            }
        },
        {
            id = "LadderBottom",
            model = `rearmount_base`,
            isLadder = false,
            attachTo = "LadderSeat",
            defaultOffSet = {0.0, 0.07, 0.6},
            offSet = {0.0, 0.07, 0.6},
            rotation = {0.0, 0.0, 0.0},
            minRotation = true,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = true,
            maximumRotation = {82.0, 0.0, 0.0},
            minOffSet = false,
            minimumOffSet = {0.0, 0.0, 0.0},
            maxOffSet = false,
            maximumOffSet = {0.0, 0.0, 0.0},
            controls = {
                [136] = {
                    movementType = "rotate",
                    axis = 1,
                    movementAmount = 0.1,
                },
                [130] = {
                    movementType = "rotate",
                    axis = 1,
                    movementAmount = -0.1,
                },
            }
        },
        {
            id = "OuterLadder",
            model = `rearmount_outer`,
            isLadder = true,
            attachTo = "LadderBottom",
            defaultOffSet = {0.0, 4.36, 0.46},
            offSet = {0.0, 4.36, 0.46},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 4.36, 0.46},
            maxOffSet = true,
            maximumOffSet = {0.0, 11.66, 0.0},
            controls = {
                [131] = {
                    movementType = "move",
                    axis = 2,
                    movementAmount = 0.01,
                },
                [132] = {
                    movementType = "move",
                    axis = 2,
                    movementAmount = -0.01,
                },
            }
        },
	    {
            id = "RotatingEnd",
            model = `rearmount_end_piece`,
            isLadder = true,
            attachTo = "OuterLadder",
            defaultOffSet = {0.0, 1.02, -0.12},
            offSet = {0.0, 1.02, -0.12},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 1.02, -0.12},
            maxOffSet = true,
            maximumOffSet = {0.0, 7.42, 0.0},
            controls = {
                [131] = {
                    movementType = "move",
                    axis = 2,
                    movementAmount = 0.01,
                },
                [132] = {
                    movementType = "move",
                    axis = 2,
                    movementAmount = -0.01,
                },
            }
        },
        {
            id = "Cage",
            model = `rearmount_cage`,
            isLadder = false,
            attachTo = "RotatingEnd",
            defaultOffSet = {0.0, 4.1, -0.37},
            offSet = {0.0, 4.1, -0.37},
            rotation = {0.0, 0.0, 0.0},
            minRotation = true,
            minimumRotation = {-172.0, 0.0, 0.0},
            maxRotation = true,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = false,
            minimumOffSet = {0.0, 0.0, 0.0},
            maxOffSet = false,
            maximumOffSet = {0.0, 0.0, 0.0},
            controls = {
                [174] = {
                    movementType = "rotate",
                    axis = 1,
                    movementAmount = 0.4,
                },
                [175] = {
                    movementType = "rotate",
                    axis = 1,
                    movementAmount = -0.4,
                },
            }
        },
        {
            id = "OutRigger1",
            model = `rearmount_outrigger`,
            isLadder = false,
            attachTo = "vehicle",
            defaultOffSet = {-0.47, 0.29, -0.09},
            offSet = {-0.47, 0.29, -0.09},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, -0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {-1.36, 0.0, 0.0},
            maxOffSet = true,
            maximumOffSet = {-0.47, 0.0, 0.0},
            controls = {
                [208] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = -0.01,
                },
                [207] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = 0.01,
                },
            }
        },
		{
            id = "Foot1",
            model = `rearmount_foot`,
            isLadder = false,
            attachTo = "OutRigger1",
            defaultOffSet = {-0.53, 0.0, -0.53},
            offSet = {-0.53, 0.0, -0.53},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 0.0, -1.10},
            maxOffSet = true,
            maximumOffSet = {0.0, 0.0, -0.53},
            controls = {
                [121] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = 0.002,
                },
                [212] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = -0.002,
                },
            }
        },
		 {
            id = "OutRigger2",
            model = `rearmount_outrigger`,
            isLadder = false,
            attachTo = "vehicle",
            defaultOffSet = {0.47, 0.29, -0.09},
            offSet = {0.47, 0.29, -0.09},
            rotation = {0.0, 0.0, 180.0},
            minRotation = false,
            minimumRotation = {0.0, -0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.47, 0.0, 0.0},
            maxOffSet = true,
            maximumOffSet = {1.36, 0.0, 0.0},
            controls = {
                [208] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = 0.01,
                },
                [207] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = -0.01,
                },
            }
        },
		{
            id = "Foot2",
            model = `rearmount_foot`,
            isLadder = false,
            attachTo = "OutRigger2",
            defaultOffSet = {-0.53, 0.0, -0.53},
            offSet = {-0.53, 0.0, -0.53},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 0.0, -1.10},
            maxOffSet = true,
            maximumOffSet = {0.0, 0.0, -0.53},
            controls = {
                [121] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = 0.002,
                },
                [212] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = -0.002,
                },
            }
        },
		{
            id = "OutRigger3",
            model = `rearmount_outrigger`,
            isLadder = false,
            attachTo = "vehicle",
            defaultOffSet = {-0.47, -4.9, -0.09},
            offSet = {-0.47, -4.9, -0.09},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, -0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {-1.36, 0.0, 0.0},
            maxOffSet = true,
            maximumOffSet = {-0.47, 0.0, 0.0},
            controls = {
                [208] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = -0.01,
                },
                [207] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = 0.01,
                },
            }
        },
		{
            id = "Foot3",
            model = `rearmount_foot`,
            isLadder = false,
            attachTo = "OutRigger3",
            defaultOffSet = {-0.53, 0.0, -0.53},
            offSet = {-0.53, 0.0, -0.53},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 0.0, -1.10},
            maxOffSet = true,
            maximumOffSet = {0.0, 0.0, -0.53},
            controls = {
                [121] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = 0.002,
                },
                [212] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = -0.002,
                },
            }
        },
		 {
            id = "OutRigger4",
            model = `rearmount_outrigger`,
            isLadder = false,
            attachTo = "vehicle",
            defaultOffSet = {0.47, -4.9, -0.09},
            offSet = {0.47, -4.9, -0.09},
            rotation = {0.0, 0.0, 180.0},
            minRotation = false,
            minimumRotation = {0.0, -0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.47, 0.0, 0.0},
            maxOffSet = true,
            maximumOffSet = {1.36, 0.0, 0.0},
            controls = {
                [208] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = 0.01,
                },
                [207] = {
                    movementType = "move",
                    axis = 1,
                    movementAmount = -0.01,
                },
            }
        },
		{
            id = "Foot4",
            model = `rearmount_foot`,
            isLadder = false,
            attachTo = "OutRigger4",
            defaultOffSet = {-0.53, 0.0, -0.53},
            offSet = {-0.53, 0.0, -0.53},
            rotation = {0.0, 0.0, 0.0},
            minRotation = false,
            minimumRotation = {0.0, 0.0, 0.0},
            maxRotation = false,
            maximumRotation = {0.0, 0.0, 0.0},
            minOffSet = true,
            minimumOffSet = {0.0, 0.0, -1.10},
            maxOffSet = true,
            maximumOffSet = {0.0, 0.0, -0.53},
            controls = {
                [121] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = 0.002,
                },
                [212] = {
                    movementType = "move",
                    axis = 3,
                    movementAmount = -0.002,
                },
            }
        },
    }
}

addVehicle(rearmount)