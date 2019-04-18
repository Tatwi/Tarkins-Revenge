# Tarkin's Revenge Housing System
In addition to the normal housing system, Tarkin's Revenge makes use of administrator placed structures and customized NPC cities to allow players to create more interesting player cities. The system is comprised of the following three key features:  

### 1. NPC Cities as Player Cities 

- Located in Coronet, Mos Entha, and Theed.
- Many static structures were removed to make way for player and admin placed structures 
- Admin placed player city hall with an enlarged city radius, so players can become mayor and run the city. 

### 2. The Houseplop Command

- Allows admins to place almost every possible structure aligned exactly how they want it.
- Structures placed in this way act like normal player houses and belong to the admin character who place the structure.
- Used to create well organized layouts in the cities.

### 3. The House Purchasing Method

- Allows players to purchase structures that have been placed by admins.
- Accessed by players through a radial menu option on Structure Management Terminals inside buildings and on Factory radial menus.
- Costs credits and requires the player to have a crafted deed in their inventory that matches the type listed as a requirement.

## Admin Information
The purchasing method portion of the system is made up of two C++ radial menu entry points (one on the factory, the other on the structure terminal) and a Lua based screenplay. Handling the the structure data required creating two new Lua calls in the Director Manager as well as a Lua table (to organize the supported buildings, their prices, and the deeds used to buy them), and a couple data-wrangling general purpose Lua functions. The system transfers the ownership in the same manner as the /transferStructure command, so all lots and permissions are handled identically.

The system is fairly straightforward to use and maintain, being comprised mainly of some Lua logic, a Lua table, and some supporting C++ functionality. Configuration of the system only requires adding the first names of the admin characters who be placing structures to the following variable in the **bin/conf/config.lua** file:  

**AdminOwnerNames = "Name1 Name2 Name3"**

Be sure that the names are separated by only a space. Not adding any names effectively disables the system (as would not having any structures placed by the admin characters in the list). Be warned, players will be able to purchase any factory and any supported structure (provided it has public entry enabled) that is placed by admin characters in the AdminOwnerNames list!

Full documentation of the how the housing table is organized and used is located in the comments of the table file itself here, bin/scripts/screenplays/tools/tarkin_housing_system_table.lua.  

The screenplay delivers a simple SUI window experience with the following steps:  

1. If player doesn't have enough lots, tell them and do not open the SUI window.
2. Open the window and provide information about the building and instructions. Also shows if the player has the required deed in ther inventory.
3. Confirm purchase or provide an rejection message for either not enough money or a missing deed.
4. Send a system message indicating the purchase was complete.  

The screenplay can be found here bin/scripts/screenplays/tools/tarkin_housing_system.lua.  

Adding new structures to the system is as simple as... 

1. Add new player structures that function the same as any other normal player structure.
2. Add the structure to the houseplop table in bin/scripts/screenplays/tools/house_plop_table.lua.
3. Add the structure to the housing system table. 
4. Place the structures into the world using /tarkin houseplop
