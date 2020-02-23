# NomicMU

NomicMU is an online system for multiplayer interactive fiction where every player may change how the game is played.

The world is described in English by players and the game server does its best to make those work correctly.

`Pants are something that can be worn.  Oh, and they have at least one pocket.`

For example you can take the text from here: https://udel.edu/~os/riddle.html

````
There are 5 houses with five different colors.
In each house lives a person with a different nationality.
These five owners drink a certain type of beverage, smoke a certain brand of cigar and keep a certain pet.
No owners have the same pet, smoke the same brand of cigar or drink the same beverage.
The Brit lives in the red house.
The Swede keeps dogs as pets.
A Dane drinks tea.
The green house is on the left of the white house.
The green house''s owner drinks coffee.
The person who smokes Pall Mall rears birds.
The owner of the yellow house smokes Dunhill.
The man living in the center house drinks milk and the Norwegian lives in the first house .
The man who smokes blends lives next to the one who keeps cats   .
The man who keeps horses lives next to the man who smokes Dunhill.
The owner who smokes BlueMaster drinks beer .
The German smokes Prince.
The Norwegian lives next to the blue house.
The man who smokes blend has a neighbor who drinks water.
````
Load it into the world. and walk arround.
You may even ask `Who owns the fish?`

Or you may walk arround the houses and find the fish for yourself.
Since it is multiplayer other people can add and change the rules however the teams may like.


# Dungion Master AI 

The NomicMU console is like a dungion master it uses some contrived SHRDLU-like AI in order to understand the players english and convert this into something like a text adventure world.

What you can do with the DM.

`dmiles wants to`> `be in the kitchen.`

The DM can be questioned about details of the world.

`dmiles wants to`> `be told where he is.`

````TODO write more````

# Players

When you first log in you may create yourself as a player character 


````
someone wants to> create player named dmiles.
dmiles wants to> look.
dmiles looks.
...
````

or take over the psychi of a Non-player-character. You occupy their mind knowing, beliving, seeing and hearing what they do.

````
someone wants to> possess player named floyd.
floyd calls behavour script: do_something(floyd).
floyd wants to be somewhere he hasnt been yet.
floyd looks.
floyd notices there are exits: north and south.
floyd knows there is the pantry to the north.
floyd does not know where he will be if he goes south.
floyd goes south.
...
````

````
someone wants to> list types
player
person
robot
screen_door
rock
area
...
````

# NPC AI

NPCs are non-player characters they are just like human characters (isntances of persons)
except they have no one logged in and controlling them.





      



# Project Progress and Goals

Initialy NomicMU was PrologMUD which was created to ensure the world was stable and working (but not using English).
NomicMU extends https://github.com/TeamSPoon/PrologMUD with two features: English and Forking. 
The English is as described above coverts into the programming language that PrologMUD interprets.
The Forking allows potential commands and AI to see if something makes sense in the world before commiting it back to PrologMUDs global state.
It is used for parsing things like:   `Joe belives the rocks are trying to tell him something` .  
This allows a private world in  `props(joe,[memory([...])...])` database where the rocks really are.
A person or NPC can began processing in a private state-space.

Each player/NPC has their own MU running in which is their `memory/2`.  As they move in this .. it also moves in the outer-MUD.
The outter-MUD sends precepts as they go which is captured by inner-MUD to `memory/2`





````
06:19] <dmiles> here is the idea i had for https://github.com/TeamSPoon/NomicMU
[06:20] <dmiles> there could be a rougelike interface running on a different port from the text server
[06:21] <dmiles> placement of the houses there btw do happen inside on the the 9x9s
[06:24] <dmiles> in the rougelike interface of PRologMUD i was using these symbols:  https://github.com/TeamSPoon/prologmud/blob/master/prolog/prologmud/objs/basic_objs.pfc.pl
[06:25] <dmiles> here was exmple of world object populator:  https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_nani/objs_misc_household.pfc.pl
[06:27] <dmiles> exmaple of a "Gridded" area https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_wumpus/maze.map.pfc.pl
[06:30] <dmiles> here to https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_startrek/holodeck/predator.map.pfc.pl
[06:31] <dmiles> and https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_startrek/holodeck/vacuum.map.pfc.pl
[06:32] <dmiles> so for example:  onSpawn(eastOf(vHere,tStoreRoom)).
[06:32] <dmiles> will place that grid next to the current 9x9
[06:36] <dmiles> the .pfc.pl means its in a special  With-Prolog-Forward-Chainng which asserts triggers logic that constucts the world based on the file contents
[06:37] <dmiles> onSpawn are ran right at the start of the world so that all the background data for the world is already loaded
[06:38] <dmiles> NomicMUD really the trick is jsut that is converts "There is a stroreroom east of here" to onSpawn(eastOf(vHere,tStoreRoom)).
[06:40] <dmiles> vHere is converted to where ever the location context was
[06:43] <dmiles> i sort of think the NomicMU has been everyones fantasy for decades. and if it wasnt their fantasy, they assumed such a think already existed, or they assumed something like that was completely impossible
[06:44] <dmiles> for example if they vaguely heard of Inform7 they might think it already existed 
[06:45] <dmiles> of If they didnt know about computers they;d think "Of course that would been easy for computers .. peopel do it all the time"
[06:46] <dmiles> if they studied AI, they'd think it was impossible but would been really cool
[06:46] <dmiles> if they studied how to write games that is
[06:46] <dmiles> studied AI nowadays.. they think it is too far off
[06:47] <dmiles> studied AI like I did 30 years ago.. stuff like this is easy
[06:48] * dmiles i think it is crazy that in 30 years no one tured our tech into a game
[06:50] <dmiles> i am probably wrong abotu those opiniopns but the main thing is it is silly such a game was not published and made comon place.. as it would be loved by millions of people
[06:52] <dmiles> well there is Guncho.. but it used inform7 
[06:52] <dmiles> NomicMU looks liek Inform7 but is not strict
[06:53] <dmiles> if NomicMU was to load Inform7 files the lack of strictness woudl leak all over
[06:54] <dmiles> Nothing wrong with inform7.. but i cant write in it out of the gate
[06:55] <dmiles> its liek i cant write in ACE (Attempto Controlled English)
[06:55] <dmiles> So why i had to write a new NLU parser
````

 





           
