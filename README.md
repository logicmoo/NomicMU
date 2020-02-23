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
Load it into the world. and walk around.
You may even ask `Who owns the fish?`

Or you may walk around the houses and find the fish for yourself.
Since it is multiplayer other people can add and change the rules however the teams may like.


# Dungeon Master AI 

The NomicMU console is like a dungeon master. It uses some contrived SHRDLU-like AI in order to understand the players english and convert this into something like a text adventure world.

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


# Players

When you first log in you may create yourself as a player character 


````
someone wants to> create player named dmiles.
dmiles wants to> look.
dmiles looks.
...
````

`dmiles wants to`> `be in the kitchen.`

The DM can be questioned about details of the world.

`dmiles wants to`> `be told where he is.`

or take over the psyche of a Non-player-character. You occupy their mind knowing, believing, seeing and hearing what they do.

````
someone wants to> possess a player named floyd.
floyd calls behaviour script: do_something(floyd).
floyd wants to be somewhere he hasn't been yet.
floyd looks.
floyd notices there are exits: north and south.
floyd knows there is the pantry to the north.
floyd does not know where he will be if he goes south.
floyd goes south.
...
````
# NPC AI

NPCs are non-player characters they are just like human characters (instances of persons)
except they have no one logged in and controlling them.

They work using Event Calculus assertions that gave them templates to follow .. they rearrange these templates so that they make sense to the current states they are in


````TODO write more````

    



# Project Progress and Goals

Initially NomicMU was PrologMUD which was created to ensure the world was stable and working (but not using English).
NomicMU extends https://github.com/TeamSPoon/PrologMUD with two features: English and Forking. 
The English is as described above converts into the programming language that PrologMUD interprets.
The Forking allows potential commands and AI to see if something makes sense in the world before committing it back to PrologMUDs global state.
It is used for parsing things like:   `Joe believes the rocks are trying to tell him something` .  
This allows a private world in  `props(joe,[memory([...])...])` database where the rocks really are.
A person or NPC can begin processing in a private state-space.

Each player/NPC has their own MU running in which is their `memory/2`.  As they move in this .. it also moves in the outer-MUD.
The outer-MUD sends precepts as they go which is captured by inner-MUD to `memory/2`




# IRC Explanation
````
[06:19] <dmiles> here is the idea i had for https://github.com/TeamSPoon/NomicMU
[06:20] <dmiles> there could be a roguelike interface running on a different port from the text server
[06:21] <dmiles> placement of the houses there btw do happen inside on the the 9x9s
[06:24] <dmiles> in the roguelike interface of PRologMUD i was using these symbols:
````
https://github.com/TeamSPoon/prologmud/blob/master/prolog/prologmud/objs/basic_objs.pfc.pl

[06:25] <dmiles> here was example of world object populator:  https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_nani/objs_misc_household.pfc.pl

[06:27] <dmiles> exmaple of a "Gridded" area https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_wumpus/maze.map.pfc.pl

[06:30] <dmiles> here to https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_startrek/holodeck/predator.map.pfc.pl

[06:31] <dmiles> and https://github.com/TeamSPoon/prologmud_samples/blob/master/prolog/prologmud_sample_games/src_game_startrek/holodeck/vacuum.map.pfc.pl

````
[06:32] <dmiles> so for example:  onSpawn(eastOf(vHere,tStoreRoom)).
[06:32] <dmiles> will place that grid next to the current 9x9
[06:36] <dmiles> the .pfc.pl means its in a special  With-Prolog-Forward-Chainng
[06:36] <dmiles> which asserts triggers logic that constructs the world based on the file contents
[06:37] <dmiles> onSpawn are ran right at the start of the world
[06:37] <dmiles>  so that all the background data for the world is already loaded
[06:38] <dmiles> NomicMUD really the trick is just that it converts "There is a storeroom east of here"
[06:38] <dmiles> to onSpawn(eastOf(vHere,tStoreRoom)).
[06:40] <dmiles> vHere is converted to wherever the location context was
[06:43] <dmiles> i sort of think the NomicMU has been everyone's fantasy for decades. 
[06:48] * dmiles i think it is crazy that in 30 years no one turned our NLU/expert systems tech into …
                                       a game maker
[07:49] <dmiles> silly such a game was not published and made commonplace.. 
[07:49] <dmiles> as it would be loved by millions of people
[06:52] <dmiles> well there is Guncho.. but it used inform7 
[06:52] <dmiles> NomicMU looks like Inform7 but is not strict
[06:53] <dmiles> if NomicMU was to load Inform7 files the lack of strictness woudl leak all over
[06:54] <dmiles> Nothing wrong with inform7.. but i cant write in it out of the gate
[06:55] <dmiles> its like i can't write in ACE (Attempto Controlled English)
[06:55] <dmiles> So that is why I had to write a new NLU parser.. One anyone can already know what to say
````
````
[07:25] <dmiles> The goal of it is to create an imagination Space
[07:25] <dmiles> that i can reuse later so that an AGI can screw with its beliefs 
[07:27] <dmiles> IOW, i believe this project is a mandatory litmus test before one can attempt to create AGI
[07:28] <dmiles> a mandatory infrastructure that is at least in some version required before hand
[07:28] <dmiles> not so much the english.. i just added that so it is more accessible
[07:29] <dmiles> but the ability to allow an imagined space.. (this is like a visual buffer)
[07:29] <dmiles> but instead of the visual data it uses SitCalc data
[07:29] <dmiles> SitCalc of course seems overly pretentious when we think Tablia Rasa
[07:30] <dmiles> Tabula Rasa is that humans are born blank slates and are neuro-tuned to having whatever we have
[07:30] <dmiles> but humans are no more tabula-rasa than any spider, bird, mammael
[07:31] <dmiles> i believe the Tabula Rasa myth has confused AI scientists into not being able to create AI
[07:33] <dmiles> once it was determined that humans if hatched from an egg with 
[07:33] <dmiles>the gestation time comparable to a spider, reptile or fish... would come out
[07:33] <dmiles>  walking and trying to understand the world   it occurred to me
[07:34] <dmiles> they be empty as all heck but they'd have all the infrastructure to start the ascent 
[07:35] <dmiles> they'd be trying already to understand the complex language
[07:35] <dmiles> with no clue how to say or understand anything
[07:35] <dmiles> but they would be already engaged in trying
[07:36] <dmiles> they would already want to play
[07:38] <dmiles> I was trying to say we just got confused when we saw babies bc they are not neuro-functional
[07:38] <dmiles> even ready to have come out of the womb
[07:38] <dmiles> so we mistakenly immagine the neurological development to be learning
[07:39] <dmiles> anyways i've explained this many times in here.. so won't do that again
[07:40] <dmiles> but the new part is that I needed to build a program that could accommodate a …
[07:40] <dmiles>  fully hatched (gestated) human
[07:40] <dmiles>  living in not just SitCalc, but EventCalc already

[07:42] <dmiles> a joke here btw.. is once the program does become AGI.. if i want to sell it as human
[07:42] <dmiles>  maybe i just need to make it crippleware that unlocks things for the first 18 months
[07:43] <dmiles> and people will imagine it was learning that whole time.. the same thing they do with humans
[07:44] <dmiles> this thing deeply only understands about 40 concepts
[07:45] <dmiles> though i layered the rest of english onto those concepts
[07:45] <dmiles> it understands the SitCalc and EventCalc operations that is 
[07:46] <dmiles> what i mean is can understand that Dog and Cat are different 
[07:46] <dmiles> but has no idea how and what they are
[07:33] <dmiles> other than they are discrete objects in a block world
[07:47] <dmiles> it understands that Dog is a label for Dog-line things
[07:47] <dmiles> it understands at most that Dog is a label for Dog-like things
[07:48] <dmiles> but doesn't have a clue or experience to know what they are
[07:48] <dmiles> other than may become blocks ina blocks world (that is what i mean by SitCalc)
[07:49] <dmiles> it also understands prying information out of the environment (which includes other people)
[07:50] <dmiles> Why? So can satisfy a EVentCalc narrative
[07:50] <dmiles> EventCalc Narratives are like the idea in the bicameral mind
[07:50] <dmiles> in that you are being nagged by some god to live out a story
[07:51] <dmiles> the lesser monkey-mind obeys because if he/she doesnt bad things happen!.. like hunger 
[07:52] <dmiles> also if it doesn't listen to the god's almost irrational fears it will get bit by a snake
[07:53] <dmiles> it learns early on to "just obey"
[07:54] <dmiles> unwilling to believe it is merely a slave, the monkey mind then begins to believe 
[07:54] <dmiles> they are the god with all the good thoughts
[07:54] <dmiles> just as we are still impressed when we think
[07:55] <dmiles> we just (and it doesn't) realize that god was long dead.. it is just prerecorded advice.. 
[07:55] <dmiles> had we been a spider it would have been recordings telling us how to make webs
[07:56] <dmiles> or a bird the god-mind tells what noises to make coming out of our mouths
[07:57] <dmiles> our god does have enforcers to.. that are still alive
[07:57] <dmiles> called the limbic system
[07:58] <dmiles> sometimes will induce crying and guilt based on specific EventCalc laws we broke
[07:59] <dmiles> (well it isn't always us that broke them.. but the environment can break them)
[07:59] <dmiles> Our monkey-minds btw are likely to use connectist/NN AI.. but not our god-mind
[08:00] <dmiles> (the god that makes us think)
[08:00] <dmiles> even apes have the same monkey-mind and the god-mind
[08:01] <dmiles> as i imply so do birds and spiders
[08:01] <dmiles> the monkey-minds job is to make the god-mind more believable to the monkey-mind..
[08:01] <dmiles> that is that it bends everything in the context as if the god-mind was applicable
[08:02] <dmiles> for example the god-mind tells it exactly how to walk.. the monkey-mind has to move the
[08:02] <dmiles> legs just right to make them work
[08:03] <dmiles> while god-mind being a backseat driver screams to not get too close to the ledge
[08:03] <dmiles> zapping the monkey in the gut whenever it gets too close
[08:04] <dmiles> eventually the monkey even gets trained to believe it is his own thought..
[08:04] <dmiles> can even reply that advice like a song in the head
[08:05] <dmiles> anyways it takes a few whole books to explain how humans and animals work.. 
[08:05] <dmiles> but they do work this way
[08:05] <dmiles> all the evidence at least points to this theory (Script-theory)
[08:06] <dmiles> i am just explaining it poorly
[08:07] <dmiles> i know a couple guys over 75 understand my theory.. they just not programmers anymore
[08:08] <dmiles> (they spent their life trying to talk me/us into it.. and it worked)
[08:08] <dmiles> (making it into mine instead of theirs)
[08:09] <dmiles> Schank never got free from "Tabula Rasa think"-ers and it crippled him
[08:10] <dmiles> but he at least gave us an example language for post-"Tablia Rasa think" 
[08:11] <dmiles> well "If Tabula Rasa was wrong or if it grew into something.. this is what it would look like"
[08:12] <dmiles> Good part in all this is there is a programmatic code path that delivers
[08:13] <dmiles> that is that it is no longer "figure it out when we get there" process
[08:13] <dmiles> it is a nose to tail TODO list
[08:14] <dmiles> NomicMU infrastructure is one of those items
[08:14] <dmiles> doing the english stuff is just so it money 
[08:15] <dmiles> just so it keeps funded by people wanting to make infinitely interesting games
[08:20] <dmiles> also its nice thing about the english Event/SitCalc that i can say things like
[08:20] <dmiles> "there exists in every mind a mental todo-list"
[08:21] <dmiles> and build up and hack the components this way
[08:21] <dmiles> describing their interactions
[08:22] <dmiles> just not sure why no one built this tool yet
[08:22] <dmiles> well cycorp did.. but they don't know they could use it to create the mind sections
[08:23] <dmiles> well at least the people that know how to use such a tool no longer wanted to work there
````


