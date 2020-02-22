# NomicMU

NomicMU is an online system for multiplayer interactive fiction where every player may change how the game is played.

The world is described in English by players and the game server does its best to make those work correctly.

`Pants are something that can be worn.  Oh, and they have at least one pocket.`

For example you can take the text from here: https://udel.edu/~os/riddle.html

````
There are 5 houses in five different colors.
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




 





           
