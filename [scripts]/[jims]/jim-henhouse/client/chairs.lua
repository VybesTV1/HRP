local QBCore = exports[Config.Core]:GetCoreObject()

local henseat, sitting, Chairs, chairlist = nil, false, {}, {}

if Config.MLO == "SM" then
--CENTER
	chairlist[#chairlist+1] = { coords = vec4(-305.63, 6266.8, 31.5, 225.0) }
	chairlist[#chairlist+1] = { coords = vec4(-306.97, 6265.44, 31.5, 225.0) }
	chairlist[#chairlist+1] = { coords = vec4(-304.18, 6262.47, 31.5, 45.0) }
	chairlist[#chairlist+1] = { coords = vec4(-303.48, 6263.15, 31.5, 45.0) }
	chairlist[#chairlist+1] = { coords = vec4(-302.74, 6263.71, 31.5, 45.0) }
	chairlist[#chairlist+1] = { coords = vec4(-302.05, 6267.05, 31.5, 45.0) }

--Table 1
	chairlist[#chairlist+1] = { coords = vec4(-306.36, 6266.14, 31.5, 225.0), stand = vec3(-302.72, 6266.42, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-301.42, 6267.58, 31.5, 45.0), stand = vec3(-302.72, 6266.42, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-302.68, 6268.88, 31.5, 225.0), stand = vec3(-302.06, 6269.66, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-303.28, 6268.25, 31.5, 225.0), stand = vec3(-303.88, 6267.87, 31.48-0.5) }
--Table2
	chairlist[#chairlist+1] = { coords = vec4(-304.21, 6269.29, 31.5, 45.0), stand = vec3(-304.85, 6268.74, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-303.51, 6269.86, 31.5, 45.0), stand = vec3(-302.92, 6270.51, 31.49-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-304.81, 6271.14, 31.5, 225.0), stand = vec3(-305.98, 6270.0, 31.49-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-305.48, 6270.49, 31.5, 225.0), stand = vec3(-305.98, 6270.0, 31.49-0.5) }
--Table3
	chairlist[#chairlist+1] = { coords = vec4(-306.86, 6258.98, 31.5, 225.0) }
	chairlist[#chairlist+1] = { coords = vec4(-307.53, 6258.39, 31.5, 225.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-308.18, 6257.78, 31.5, 225.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-308.85, 6257.22, 31.5, 225.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }

	chairlist[#chairlist+1] = { coords = vec4(-305.54, 6257.72, 31.5, 45.0) }
	chairlist[#chairlist+1] = { coords = vec4(-306.19, 6257.15, 31.5, 45.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-306.94, 6256.51, 31.5, 45.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-307.58, 6255.88, 31.5, 45.0), stand = vec3(-305.89, 6258.62, 31.48-0.5) }
--Table4
	chairlist[#chairlist+1] = { coords = vec4(-304.72, 6256.83, 31.5, 225.0) }
	chairlist[#chairlist+1] = { coords = vec4(-305.41, 6256.14, 31.5, 225.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-306.13, 6255.45, 31.5, 225.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-306.8, 6254.82, 31.5, 225.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }

	chairlist[#chairlist+1] = { coords = vec4(-303.37, 6255.34, 31.5, 45.0) }
	chairlist[#chairlist+1] = { coords = vec4(-304.04, 6254.82, 31.5, 45.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-304.74, 6254.22, 31.5, 45.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-305.42, 6253.57, 31.5, 45.0), stand = vec3(-303.91, 6256.34, 31.48-0.5) }

--STOOLS
	chairlist[#chairlist+1] = { coords = vec4(-296.89, 6265.69, 31.48+0.26, 225.0), stand = vec3(-297.12, 6265.85, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-297.57, 6265.01, 31.48+0.26, 225.0), stand = vec3(-297.79, 6265.18, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-298.28, 6264.41, 31.48+0.26, 225.0), stand = vec3(-298.48, 6264.62, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-299.01, 6263.67, 31.48+0.26, 225.0), stand = vec3(-299.15, 6263.93, 31.48-0.5) }

	chairlist[#chairlist+1] = { coords = vec4(-298.79, 6260.83, 31.48+0.26, 312.83), stand = vec3(-299.02, 6260.65, 31.48-0.5) }
	chairlist[#chairlist+1] = { coords = vec4(-298.21, 6260.16, 31.48+0.26, 312.83), stand = vec3(-298.47, 6260.02, 31.48-0.5) }

--UPSTAIRS
	chairlist[#chairlist+1] = { coords = vec4(-299.31, 6272.47, 34.8, 175.0), }
	chairlist[#chairlist+1] = { coords = vec4(-297.79, 6270.83, 34.8, 85.0), }

	chairlist[#chairlist+1] = { coords = vec4(-302.62, 6276.81, 34.8, 135.0), }
	chairlist[#chairlist+1] = { coords = vec4(-302.05, 6276.08, 34.8, 135.0), }
	chairlist[#chairlist+1] = { coords = vec4(-301.7, 6274.1, 34.8, 45.0), }
	chairlist[#chairlist+1] = { coords = vec4(-303.4, 6273.51, 34.8, 0.0), }


	chairlist[#chairlist+1] = { coords = vec4(-294.14, 6266.8, 31.5, 268.1), }
	chairlist[#chairlist+1] = { coords = vec4(-292.95, 6265.41, 31.5, 332.1), }

	chairlist[#chairlist+1] = { coords = vec4(-293.84, 6266.34, 34.8, 107.0), }
	chairlist[#chairlist+1] = { coords = vec4(-296.15, 6265.24, 34.8, 285.0), }
	chairlist[#chairlist+1] = { coords = vec4(-295.22, 6264.01, 34.8, 328.0), }


	chairlist[#chairlist+1] = { coords = vec4(-299.9, 6260.67, 34.8, 316.0), }
	chairlist[#chairlist+1] = { coords = vec4(-299.32, 6259.95, 34.8, 316.0), }
	chairlist[#chairlist+1] = { coords = vec4(-297.46, 6261.61, 34.8, 136.0), }
	chairlist[#chairlist+1] = { coords = vec4(-298.1, 6262.28, 34.8, 136.0), }
elseif Config.MLO == "GN" then
-- STOOLS --
	chairlist[#chairlist+1] = { coords = vec4(-306.97, 6265.59, 31.83, 316.40), stand = vec3(-307.51, 6265.22, 31.53)  }
	chairlist[#chairlist+1] = { coords = vec4(-305.89, 6265.38, 31.83, 44), stand = vec3(-305.63, 6264.97, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-304.52, 6266.02, 31.83, 44), stand = vec3(-303.73, 6265.42, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-303.60, 6267.58, 31.83, 44), stand = vec3(-303.21, 6267.22, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-302.24, 6268.42, 31.83, 44), stand = vec3(-301.69, 6267.81, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-302.02, 6269.23, 31.83, 44), stand = vec3(-301.47, 6268.79, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-300.71, 6270.49, 31.83, 44), stand = vec3(-300.19, 6270.1, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-301.32, 6269.85, 31.83, 44), stand = vec3(-300.76, 6269.29, 31.53) }
	chairlist[#chairlist+1] = { coords = vec4(-303.10, 6268.12, 31.83, 44), stand = vec3(-302.67, 6267.61, 31.53) }
------ Table 1 -------
	chairlist[#chairlist+1] = { coords = vec4(-299.20, 6266.56, 31.83, 224.35), stand = vec3(-299.66, 6266.96, 31.53) } -- chair 1
	chairlist[#chairlist+1] = { coords = vec4(-299.21, 6265.57, 31.83, 328.81), stand = vec3(-299.54, 6265.19, 31.53) }-- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-298.06, 6266.60, 31.83, 131.36), stand = vec3(-297.65, 6266.85, 31.53) }-- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-298.20, 6265.57, 31.83, 63.68), stand = vec3(-297.87, 6265.28, 31.53) }-- Chair 4
------- Table 2 -------
	chairlist[#chairlist+1] = { coords = vec4(-296.79, 6264.23, 31.83, 216.61), stand = vec3(-297.15, 6264.69, 31.53) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-296.88, 6263.08, 31.83, 327.16), stand = vec3(-297.43, 6262.87, 31.53) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-295.70, 6263.14, 31.83, 48), stand = vec3(-295.44, 6262.74, 31.53) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-295.77, 6264.24, 31.83, 155.03), stand = vec3(-295.54, 6264.56, 31.53) } -- Chair 4
------- Table 3 -------
	chairlist[#chairlist+1] = { coords = vec4(-299.54, 6260.13, 31.83, 357.95), stand = vec3(-299.59, 6259.36, 31.53) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-300.24, 6260.69, 31.83, 267.46), stand = vec3(-300.84, 6260.66, 31.53) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-299.56, 6261.58, 31.83, 166.23), stand = vec3(-299.58, 6261.99, 31.53) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-298.75, 6260.74, 31.83, 80.8), stand = vec3(-298.14, 6260.79, 31.53) } -- Chair 4
------- Table 4 -------
	chairlist[#chairlist+1] = { coords = vec4(-301.68, 6263.99, 31.83, 166.23), stand = vec3(-301.62, 6264.46, 31.53) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-301.85, 6262.48, 31.83, 357.95), stand = vec3(-301.64, 6261.95, 31.53) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-302.58, 6263.29, 31.83, 267.46), stand = vec3(-303.12, 6263.28, 31.53) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-301.07, 6263.24, 31.83, 81.37), stand = vec3(-300.43, 6263.21, 31.53) } -- Chair 4
---------Lobby--------
	chairlist[#chairlist+1] = { coords = vec4(-309.44, 6263.70, 31.63, 55.49), stand = vec3(-309.02, 6263.47, 31.52) } -- piano
	chairlist[#chairlist+1] = { coords = vec4(-310.85, 6262.09, 31.52, 271.14), stand = vec3(-310.18, 6262.09, 31.53) }

---------Upstairs--------
------ Table 1 -------
	chairlist[#chairlist+1] = { coords = vec4(-304.49, 6269.97, 35.19, 321.67), stand = vec3(-304.79, 6269.38, 34.89) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-303.33, 6270.1, 35.19, 37.33), stand = vec3(-302.8, 6269.79, 34.89) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-303.23, 6271.24, 35.19, 128.59), stand = vec3(-302.91, 6271.6, 34.89) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-304.43, 6271.24, 35.19, 239.13), stand = vec3(-304.24, 6271.66, 34.89) } -- Chair 4
------ Table 2 -------
	chairlist[#chairlist+1] = { coords = vec4(-300.0, 6268.06, 34.90, 182.22), stand = vec3(-299.95, 6268.85, 34.89) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-300.81, 6267.57, 34.90, 249.46), stand = vec3(-301.53, 6267.84, 34.89) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-301.13, 6266.28, 34.90, 286.77), stand = vec3(-301.86, 6266.05, 34.89) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-299.87, 6265.6, 34.90, 15.74), stand = vec3(-299.61, 6264.93, 34.89) } -- Chair 4
	chairlist[#chairlist+1] = { coords = vec4(-298.98, 6266.32, 34.90, 42.16), stand = vec3(-298.41, 6265.84, 34.89) } -- Chair 5
------ Table 3 -------
	chairlist[#chairlist+1] = { coords = vec4(-297.1, 6265.02, 34.90, 180.1), stand = vec3(-297.22, 6265.78, 34.89) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-298.07, 6264.64, 34.90, 245.19), stand = vec3(-298.87, 6264.93, 34.89) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-298.39, 6263.56, 34.90, 323.37), stand = vec3(-298.87, 6262.92, 34.89) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-297.19, 6262.86, 34.90, 25.89), stand = vec3(-297.64, 6262.23, 34.89) } -- Chair 4
	chairlist[#chairlist+1] = { coords = vec4(-296.22, 6263.46, 34.90, 85.24), stand = vec3(-295.38, 6263.49, 34.89) } -- Chair 5
------ Table 4 -------
	chairlist[#chairlist+1] = { coords = vec4(-300.08, 6261.71, 34.90, 176.71), stand = vec3(-300.14, 6262.52, 34.89) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-301.17, 6261.11, 34.90, 250.33), stand = vec3(-301.94, 6261.41, 34.89) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-301.25, 6259.96, 34.90, 282.78), stand = vec3(-302.04, 6259.82, 34.89) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-300.14, 6259.21, 34.90, 20.91), stand = vec3(-299.8, 6258.47, 34.89) } -- Chair 4
	chairlist[#chairlist+1] = { coords = vec4(-298.90, 6260.01, 34.90, 57.79), stand = vec3(-298.31, 6259.69, 34.89) } -- Chair 5
	chairlist[#chairlist+1] = { coords = vec4(-298.95, 6261.18, 34.90, 130.03), stand = vec3(-298.36, 6261.73, 34.89) } -- Chair 6
------ Table 5 -------
	chairlist[#chairlist+1] = { coords = vec4(-302.15, 6264.04, 34.90, 115.51), stand = vec3(-301.44, 6264.37, 34.89) } -- Chair 1
	chairlist[#chairlist+1] = { coords = vec4(-304.31, 6263.17, 34.90, 284.37), stand = vec3(-305.08, 6262.84, 34.89) } -- Chair 2
	chairlist[#chairlist+1] = { coords = vec4(-303.35, 6262.41, 34.90, 36.45), stand = vec3(-303.12, 6261.77, 34.89) } -- Chair 3
	chairlist[#chairlist+1] = { coords = vec4(-303.3, 6264.7, 34.90, 188.99), stand = vec3(-303.4, 6265.49, 34.89) } -- Chair 4
	chairlist[#chairlist+1] = { coords = vec4(-304.23, 6264.16, 34.90, 250.01), stand = vec3(-304.98, 6264.48, 34.89) } -- Chair 5
	chairlist[#chairlist+1] = { coords = vec4(-302.4, 6263.05, 34.90, 54.63), stand = vec3(-301.7, 6262.69, 34.89) } -- Chair 6

--Employee
	chairlist[#chairlist+1] = { coords = vec4(-293.61, 6265.24, 31.50, 313.65) }
	chairlist[#chairlist+1] = { coords = vec4(-292.97, 6264.65, 31.50, 313.65) }
	chairlist[#chairlist+1] = { coords = vec4(-292.46, 6265.9, 31.50, 139.83) }
	chairlist[#chairlist+1] = { coords = vec4(-294.96, 6266.54, 31.50, 298.54) }
	chairlist[#chairlist+1] = { coords = vec4(-297.33, 6269.02, 31.50, 309.68) }
	chairlist[#chairlist+1] = { coords = vec4(-298.1, 6269.69, 31.50, 311.53) }
	chairlist[#chairlist+1] = { coords = vec4(-298.6, 6270.24, 31.50, 317.78) }
elseif Config.MLO == "PR" then
	chairlist[#chairlist+1] = { coords = vec4(-299.12, 6269.83, 31.50, 124.13), stand = vec3(-299.68, 6270.49, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-300.77, 6271.18, 31.50, 317.29), stand = vec3(-300.31, 6271.66, 31.51) }
	chairlist[#chairlist+1] = { coords = vec4(-301.31, 6271.81, 31.50, 312.89), stand = vec3(-300.81, 6272.25, 31.51) }

	-- STOOLS --
	chairlist[#chairlist+1] = { coords = vec4(-305.22, 6269.4, 31.69, 314.5), stand = vec3(-305.55, 6269.02, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-304.64, 6268.84, 31.69, 314.5), stand = vec3(-305.04, 6268.49, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-304.14, 6268.37, 31.69, 314.5), stand = vec3(-304.45, 6267.81, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-303.68, 6267.8, 31.69, 314.5), stand = vec3(-303.96, 6267.37, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-301.19, 6265.18, 31.69, 314.5), stand = vec3(-301.52, 6264.88, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-300.74, 6264.61, 31.69, 314.5), stand = vec3(-301.0, 6264.23, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-300.29, 6264.09, 31.69, 314.5), stand = vec3(-300.58, 6263.73, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-298.74, 6263.94, 31.69, 46), stand = vec3(-298.11, 6263.26, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-298.22, 6264.4, 31.69, 46), stand = vec3(-297.65, 6263.96, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-297.66, 6264.87, 31.69, 46), stand = vec3(-297.1, 6264.21, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-297.07, 6265.52, 31.69, 46), stand = vec3(-296.61, 6265.05, 31.49) }

	chairlist[#chairlist+1] = { coords = vec4(-304.99, 6258.68, 31.69, 123.19), stand = vec3(-304.49, 6259.1, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-305.71, 6259.01, 31.69, 225.74), stand = vec3(-306.14, 6259.37, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-306.02, 6258.34, 31.69, 299.1), stand = vec3(-306.51, 6258.1, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-305.25, 6258.01, 31.69, 24.96), stand = vec3(-305.06, 6257.5, 31.49) }

	chairlist[#chairlist+1] = { coords = vec4(-304.77, 6260.62, 31.69, 42.55), stand = vec3(-304.52, 6260.28, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-304.69, 6261.58, 31.69, 129.67), stand = vec3(-304.32, 6261.81, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-305.68, 6261.68, 31.69, 225.56), stand = vec3(-306.17, 6262.09, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-305.65, 6260.7, 31.69, 317.7), stand = vec3(-305.97, 6260.36, 31.49) }

	chairlist[#chairlist+1] = { coords = vec4(-302.67, 6262.15, 31.69, 223.56), stand = vec3(-302.94, 6262.59, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-303.08, 6261.36, 31.69, 320.68), stand = vec3(-303.51, 6261.25, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-302.18, 6261.09, 31.69, 34.48), stand = vec3(-301.97, 6260.62, 31.49) }
	chairlist[#chairlist+1] = { coords = vec4(-301.93, 6261.89, 31.69, 132.01), stand = vec3(-301.48, 6262.3, 31.49) }
	-- Booth 1
	chairlist[#chairlist+1] = { coords = vec4(-311.38, 6260.49, 31.39, 221), stand = vec3(-309.92, 6261.21, 31.49) } --1
	chairlist[#chairlist+1] = { coords = vec4(-310.7, 6261.01, 31.39, 221), stand = vec3(-309.92, 6261.21, 31.49) } -- 2
	chairlist[#chairlist+1] = { coords = vec4(-310.44, 6259.51, 31.39, 47.4), stand = vec3(-309.92, 6261.21, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-309.81, 6260.12, 31.39, 47.4), stand = vec3(-309.92, 6261.21, 31.49) }	--4
	--- BOOTH 2
	chairlist[#chairlist+1] = { coords = vec4(-309.69, 6258.74, 31.39, 221), stand = vec3(-308.09, 6259.5, 31.49) } -- 1
	chairlist[#chairlist+1] = { coords = vec4(-309.1, 6259.28, 31.39, 221), stand = vec3(-308.09, 6259.5, 31.49) }	--2
	chairlist[#chairlist+1] = { coords = vec4(-308.79, 6257.8, 31.39, 47.4), stand = vec3(-308.09, 6259.5, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-308.18, 6258.34, 31.39, 47.4), stand = vec3(-308.09, 6259.5, 31.49) } -- 4
	--- BOOTH 3
	chairlist[#chairlist+1] = { coords = vec4(-307.09, 6255.95, 31.39, 47.4), stand = vec3(-306.33, 6257.39, 31.49) } -- 1
	chairlist[#chairlist+1] = { coords = vec4(-306.46, 6256.53, 31.39, 47.4), stand = vec3(-306.67, 6257.79, 31.49) } -- 2
	chairlist[#chairlist+1] = { coords = vec4(-308.05, 6256.95, 31.39, 221), stand = vec3(-306.67, 6257.79, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-307.42, 6257.55, 31.39, 221), stand = vec3(-306.67, 6257.79, 31.49) } -- 4
	--- BOOTH 4
	chairlist[#chairlist+1] = { coords = vec4(-298.52, 6261.27, 31.39, 138), stand = vec3(-299.47, 6261.46, 31.49) } -- 1
	chairlist[#chairlist+1] = { coords = vec4(-297.98, 6260.64, 31.39, 138), stand = vec3(-299.47, 6261.46, 31.49) } -- 2
	chairlist[#chairlist+1] = { coords = vec4(-298.97, 6259.71, 31.39, 314), stand = vec3(-299.47, 6261.46, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-299.5, 6260.37, 31.39, 314), stand = vec3(-299.47, 6261.46, 31.49) } -- 4
	--- BOOTH 5
	chairlist[#chairlist+1] = { coords = vec4(-296.17, 6262.4, 31.39, 138), stand = vec3(-297.57, 6263.21, 31.49) } -- 1
	chairlist[#chairlist+1] = { coords = vec4(-296.72, 6262.98, 31.39, 138), stand = vec3(-297.57, 6263.21, 31.49) } -- 2
	chairlist[#chairlist+1] = { coords = vec4(-297.2, 6261.44, 31.39, 314), stand = vec3(-297.57, 6263.21, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-297.67, 6262.03, 31.39, 314), stand = vec3(-297.57, 6263.21, 31.49) } -- 4
	--- BOOTH 6
	chairlist[#chairlist+1] = { coords = vec4(-294.31, 6264.1, 31.39, 138), stand = vec3(-296.07, 6264.82, 31.49) } -- 1
	chairlist[#chairlist+1] = { coords = vec4(-294.87, 6264.71, 31.39, 138), stand = vec3(-296.07, 6264.82, 31.49) } -- 2
	chairlist[#chairlist+1] = { coords = vec4(-295.37, 6263.13, 31.39, 314), stand = vec3(-296.07, 6264.82, 31.49) } -- 3
	chairlist[#chairlist+1] = { coords = vec4(-295.95, 6263.74, 31.39, 314), stand = vec3(-296.07, 6264.82, 31.49) } -- 4
end

CreateThread(function()
	local i = 0
	for _, v in pairs(chairlist) do i += 1
		Chairs["HenChair"..i] =
			exports['qb-target']:AddBoxZone("HenChair"..i, vec3(v.coords.x, v.coords.y , v.coords.z-1.03), 0.6, 0.6, { name= "HenChair"..i, heading = v.coords[4], debugPoly = Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.2, },
				{ options = { { event = "jim-henhouse:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].target["sit"], loc = v.coords, stand = v.stand }, },
					distance = 2.2 })
	end
	if Config.Debug then print("^5Debug^7: ^2Created ^6"..i.." ^2Chairs^7") end
end)

RegisterNetEvent('jim-henhouse:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", Loc[Config.Lan].error["seat_taken"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		henseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if henseat then SetEntityCoords(ped, vec3(henseat.x, henseat.y, henseat.z-0.7)) end
				henseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k, v in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
	end
end)