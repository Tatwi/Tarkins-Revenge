--Adds ticket terminals inside the starport rings

tarkin_travel = ScreenPlay:new {
	numberOfActs = 1,

	termModel = "object/tangible/terminal/terminal_travel.iff",
	terminals = {
		--Corellia
		{planetName = "corellia", x = -162.347, z = 28.0205, y = -4941.13, ow = -0.708866, oy = -0.705343, cellID = 0}, --Coronet starport
		{planetName = "corellia", x = 3374.36, z = 308, y = 5620.35, ow = 0.882176, oy = -0.470919, cellID = 0}, --Doaba Guerfel starport
		{planetName = "corellia", x = -3144.95, z = 31, y = 2906.44, ow = -0.745701, oy = 0.666281, cellID = 0}, --Kor Vella starport
		{planetName = "corellia", x = -4973.41, z = 21, y = -2214.52, ow = 0.908409, oy = -0.418084, cellID = 0},  --Tyrena starport

		--Naboo
		{planetName = "naboo", x = -9.57878, z = 7.9918, y = 13.2393, ow = -0.695864, oy = 0.718174, cellID = 1692104}, --Theed starport
		{planetName = "naboo", x = 5309.28, z = -192, y = 6672.16, ow = -0.999633, oy = 0.0270844, cellID = 0}, --Kaadara starport
		{planetName = "naboo", x = 1340.71, z = 13, y = 2758.44, ow = 0.0270844, oy = 0.999633, cellID = 0}, --Keren starport
		{planetName = "naboo", x = 4712.08, z = 4.17, y = -4650.63, ow = -0.274025, oy = 0.961724, cellID = 0}, --Moenia starport

		--Rori
		{planetName = "rori", x = -5388.16, z = 80, y = -2158.9, ow = -0.285623, oy = 0.958342, cellID = 0}, --Narmle starport
		{planetName = "rori", x = 5354.74, z = 80, y = 5764.39, ow = -0.687696, oy = 0.725999, cellID = 0}, --Restuss starport

		--Talus
		{planetName = "talus", x = 232.766, z = 6, y = -2940.81, ow = 0.0157754, oy = 0.999876, cellID = 0}, --Dearic starport
		{planetName = "talus", x = 4474.16, z = 2, y = 5379.66, ow = -0.748354, oy = 0.6633, cellID = 0}, --Nashal starport

		--Tatooine
		{planetName = "tatooine", x = 1043.96, z = 7.21701, y = 2994.05, ow = -0.0278541, oy = 0.999613, cellID = 0}, --Mos Entha starport
		{planetName = "tatooine", x = -2813.75, z = 5, y = 2081.38, ow = -0.961512, oy = -0.274765, cellID = 0}, --Mos Espa starport
		{planetName = "tatooine", x = -1389.37, z = 12, y = -3583.92, ow = -0.0601424, oy = 0.99819, cellID = 0}, --Bestine starport
		{planetName = "tatooine", x = 3630.8, z = 5, y = -4791.24, ow = 0.999876, oy = -0.0157754, cellID = 0}, --Mos Eisley starport
	}
}

registerScreenPlay("tarkin_travel", true)

function tarkin_travel:start()
	-- Spawn terminals
	for i = 1, #self.terminals, 1 do
		local pTerminal = spawnSceneObject(self.terminals[i].planetName, self.termModel , self.terminals[i].x, self.terminals[i].z, self.terminals[i].y, self.terminals[i].cellID, self.terminals[i].ow, 0, self.terminals[i].oy, 0)
	end
end

