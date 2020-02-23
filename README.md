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
# NPC AI

NPCs are non-player characters they are just like human characters (isntances of persons)
except they have no one logged in and controlling them.

They work using Event Calculus assertions that gave them templetes to follow .. they re-arrange these templates so that they make sense to the current states they are in


````TODO write more````

    



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




# IRC Explaination
````
[06:19] <dmiles> here is the idea i had for https://github.com/TeamSPoon/NomicMU
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
[06:46] <dmiles> if they studied computers or AI nowadays, they'd think it was impossible or too far off
[06:47] <dmiles> studied AI like I did 30 years ago.. stuff like this is easy
[06:48] * dmiles i think it is crazy that in 30 years no one turned our NLU/expert systems tech into a game maker
[06:50] <dmiles> i am probably wrong abotu those opiniopns but the main thing is it is silly such a game was not published and made comon place.. as it would be loved by millions of people
[06:52] <dmiles> well there is Guncho.. but it used inform7 
[06:52] <dmiles> NomicMU looks liek Inform7 but is not strict
[06:53] <dmiles> if NomicMU was to load Inform7 files the lack of strictness woudl leak all over
[06:54] <dmiles> Nothing wrong with inform7.. but i cant write in it out of the gate
[06:55] <dmiles> its liek i cant write in ACE (Attempto Controlled English)
[06:55] <dmiles> So why i had to write a new NLU parser.. One anyone can already know what to say
````
````
[07:25] <dmiles> The goal of it is to create an immagination Space
[07:25] <dmiles> that i can reuse later so that an AGI can screw with its beliefs 
[07:27] <dmiles> IOW, i belive this project is a manditory litmus test before one can attempt to create AGI
[07:28] <dmiles> a manditory intrastructure that is at least in some version required before hand
[07:28] <dmiles> not so much the english.. i just added that so it is more accesaable
[07:29] <dmiles> but the ablity to allow an immaginion space.. (this is like a visual buffer)
[07:29] <dmiles> but isntead of the visual data it uses SitCalc data
[07:29] <dmiles> SitCalc of course seems overly pretentious when we think Tablia Rasa
[07:30] <dmiles> Tablia Rasa is that humans are born blank slates and are neuro-tuned to having whatever we have
[07:30] <dmiles> but humans are no more tablia-rasa than any spider, bird, mammael
[07:31] <dmiles> i belive the Tablia Rasa myth has confused AI scientists into not being able to create AI
[07:33] <dmiles> once it was determined that humans if hatched from an egg with the gestation time compareabel to a spider, reptile or fish... would come out walking and talking
[07:33] <dmiles> it occured to me
[07:34] <dmiles> they be empty as all heck but they'd have all the infrastrature to start the ascent up to human intelligence
[07:35] <dmiles> the talking part is a little silly the way i said it.. but what i meant is that they'd be trying already to understrand the complex language as if a non-native speaker
[07:35] <dmiles> they jsut have no clue how to say or understand anything
[07:35] <dmiles> but they would be alreeady engaged in trying
[07:36] <dmiles> they would walk and evne point at things
[07:36] <dmiles> they would already want to play
[07:38] <dmiles> we jsut get confused when we see babies bc they are not yet until arround 18 months even ready to have come out of the womb
[07:38] <dmiles> so we mistakenly immagine the nuerological development to be learning
[07:39] <dmiles> anyways i've explained this many times in here.. so wont do that again
[07:40] <dmiles> but the new part is that I needed to beuild a program that could accomidate a full gestated human
[07:40] <dmiles> since a fully gentated human is living in SitCalc and EventCalc already
[07:40] <dmiles> gestated*
[07:42] <dmiles> a joke here btw.. is once the program does become AGI.. if i want to sell it as huamn.. maybe i jsut need to make it crippleware that unlocks things for the first 18 months
[07:43] <dmiles> and peopel will immaigne it was learning that whole time.. the same thing they do with humans
[07:44] <dmiles> this thing deeply only udnerstands about 40 words
[07:45] <dmiles> though i layered the rest of english onto those 40 words
[07:45] <dmiles> it understands the SitCalc and EventCalc operations that is 
[07:46] <dmiles> what i mean is can understand that Dog and Cat are differnt but has no idea how and what they are otehjr than they are descrete objects in a blockworld
[07:47] <dmiles> it understands that Dog is a lable for Dog-line things
[07:47] <dmiles> it understands at most that Dog is a label for Dog-like things
[07:48] <dmiles> but doesnt have a clue or experience to know what theyu are
[07:48] <dmiles> other than may become blocks ina blacks world (that is what i mean by SitCalc)
[07:49] <dmiles> blocks*
[07:49] <dmiles> it also understands prying information out of other people and the environment
[07:50] <dmiles> that doing so can satisfy a EVentCalc narative
[07:50] <dmiles> EventCalc Naratives are like the idea in the Bicammeral mind that you are being nagged by some god to live out a story
[07:51] <dmiles> the lesser monkey-mind obeys becaue it he/she doesnt bads things happen.. like hunger 
[07:52] <dmiles> if it doesnt listen to the god's almost irrational fears it will get bit by a snake
[07:53] <dmiles> it learns early on to "just obey"
[07:53] <dmiles> inwilling to belive it is merely a salve.  the moneky mind then begins to belive they are the god with all the good thoughts
[07:54] <dmiles> unwilling to belive it is merely a slave, the moneky mind then begins to belive they are the god with all the good thoughts
[07:54] <dmiles> just as we are still impressed when we think
[07:55] <dmiles> we just (and it doesnt) realize that god was long dead.. it is jsut prerecorded advice.. had we been a spider it would have been recordings telling us how to make webs
[07:56] <dmiles> bird or telling us what noises to make comming out of our mouths
[07:57] <dmiles> our god does have inforcers though that are still alive
[07:57] <dmiles> called the limbic system
[07:58] <dmiles> soemtimes will induce crying and guilt
[07:58] <dmiles> based on specific EventCalc laws we broke
[07:59] <dmiles> (well it isnt always us that broke them.. but the environemnt can break them)
[07:59] <dmiles> we monkeys btw are very likely using a NN.. but not god
[08:00] <dmiles> (the god that makes us think)
[08:00] <dmiles> even mokeys have the same mind
[08:00] <dmiles> i mena they have the monkey-mind and the god-mind
[08:01] <dmiles> as i imply so do birds and spiders
[08:01] <dmiles> the monkey-minds job is to make the god-mind more belivable to the monkey-mid.. that is that it see everything in the context as if the god-mind was applicable
[08:02] <dmiles> for exmaple the god-mind tells it exactly how to walk.. the minkey has to move the legs jsut right to make them work
[08:03] <dmiles> while god-mind being a backseat driver screams to not get to close to the ledge
[08:03] <dmiles> zapping the monkey in the gut whenever it gets too close
[08:04] <dmiles> evetualyl the monkey even gets trained to beive it is his own thought.. premetly echos that advice
[08:05] <dmiles> anyways it take a whole book to explain how humans and animals work.. but they do work this way
[08:05] <dmiles> all the sicnetific evedence at least points to my theory
[08:06] <dmiles> i am jsut explaining it poorly
[08:07] <dmiles> i know a couple guys over 75 understand my theory.. they jsut not programmers 
[08:08] <dmiles> (they spent their life trying to talk me into it.. and it worked)
[08:08] <dmiles> (making it into mine instead of theirs)
[08:09] <dmiles> Schank never got free from "Tablia Rasa think"-ers and it crippled him
[08:10] <dmiles> but he at least gave us a language for post-"Tablia Rasa think" 
[08:11] <dmiles> well "If Tablia Rasa was wrong or if it grew into somethnjing.. this is what it would look like"
[08:12] <dmiles> Good part in all this is there is a programmatic code path that deleviers
[08:13] <dmiles> that is that it is no longer "figure it out when we get there" process
[08:13] <dmiles> it is a nose to tail TODO list
[08:14] <dmiles> NomicMU infrastructure is one of those items
[08:14] <dmiles> doing the english stuff is jsut so it money 
[08:15] <dmiles> jsut so it keeps funded by peopel wanting to make infinately interesting games
[08:20] <dmiles> also its nice thing about the english Event/SitCalc that i can say things liek "there exists in every mind a mental todo-list"
[08:21] <dmiles> and build up and hack the compoents this way
[08:21] <dmiles> describing their interactions
[08:22] <dmiles> just not sure why no one built this tool yet
[08:22] <dmiles> well cycorp did.. but they dont know they could use it to create the mind sections
[08:23] <dmiles> well at least the people that know how to use such a tool no longer wanted to work there
````
