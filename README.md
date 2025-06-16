[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/forzt7O_)

Ryan Barnes GH63570 Semester Project :Rat Puzzle Game

Overview: SRC - Contains all project files for the rat game including scripts for both the lobby and main-game places
          Client- Contains Client side scripts for both places
          Server- Contains Server side scripts for both places
          miscScripts - Contains scripts that I had trouble with ROJO placing in the wrong spots


Work Log:
3/14/2025 Finished Lobby for players to join and get teleported to game. Everything works except teleport functionality(game needs to be published first to test due to roblox gameID not existing yet). Implemented Morse Code half of the chain puzzle 
3/16/2025 Custom character model does not hold items correctly, worked on fixing this
3/18/2025 Worked on making the Simon puzzle and getting the body to spawn on the table only when player has body in inventory
3/20/2025 Simon Puzzle finished 
3/21/2025 Generator puzzle finished and linked to the shock orb
3/22/2025 Created Lock model and worked on letting the player change the letters
3/23/2025 Implemented Camera teleport for lock puzzle and started elixer puzzle
3/25/2025 finished implementing the lock puzzle, got the final lever to properly check puzzle progress before finshing,
          fixed a bug with simon puzzle where lights could be turned off after solution found, continued work on elixer puzzle,
          started work on animation for when frankeinrat wakes up. Implemented script to have rat run towards his final position
4/2/2025  Worked more on the elixer puzzle(getting different chemicals to add to your inventory)
          Added Barrels to get different chemicals from. Correct chemical added when requested, only 1 copy of each chemical per player is enforced
4/3/2025  Fixed a bug where items would not delete from all players when no longer needed. Began work on creating Oven and Mixing table
          for the elixer puzzle. Mixing table takes 2 chemicals and outputs 1 based on the two added. Oven takes one chemical and modifies it.
4/14/2025 Started working on functions to clone potions between the player and the physical space in the world where the item should be placed/removed

4/18/2025 had to refactor how my potions were being added to the players so that the server knows about it so that I can clone things properly from the player later.(They wouldn't append properly to the character when equipped because the server doesn't know what its equipping)

4/20/2025 got the potions to properly place and mix in the mixer and remove a potion. got oven to hold one potion and cook it to another and remove it. Implemented logic for how the potions get turned into each other. 

4/21/2025 Finished elixer puzzle logic(still need to make the instructions for it), got frankeinrat to spawn and escape properly when all puzzles are complete

4/22/2025 worked on recipe book gui for the elixer puzzle's instructions

4/24/2025 made images for recipe book gui recipes changed colors of some UI elements, added a trash can so you can dispose of accidents in the puzzle

4/27/2025 Final day of project, added flashing light warning, redid some visuals, finished the recipe book


