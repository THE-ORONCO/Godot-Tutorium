# A small jump and run for the tutorium

## Contents

### Notes on AI

If you want to use AI please use the [AGENTS.md](AGENTS.md) file. Solving the problems is the thing you should try to
learn. Letting the AI solve everything does not help you learn the process. When you use it do it as a question partner.

## Sessions

### Session 1

- the basics of Godot and how to create a 2D jump and run player character

### Session 2

#### Collision & Layers & Masks

- [official docs](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#collision-layers-and-masks)
- [video](https://www.youtube.com/watch?v=YPZQM6w7rlI)

#### Scene Loading

- via the simple `change_scene_to_file(...)`, `change_scene_to_packed(...)`,
  `change_scene_to_node(...)`  ([docs](https://docs.godotengine.org/en/stable/tutorials/scripting/change_scenes_manually.html))
- [background loading for chunk based levels](https://docs.godotengine.org/en/stable/tutorials/io/background_loading.html)

### Session 3

#### Globals / Autoloads

- if you ever need things to be available everywhere, at any time and have them not reset when changing scenes, use
  autoloads
	- [godot docs about autoloads](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html)
	- these can be both a script or a complete scene
		- scripts are useful for simple things like counters, constants, or utility functions
		- scenes are useful for complex things like managers, UI, or game states
- we created an example implementation in [Scripts/score_keeper.gd](Scripts/score_keeper.gd) during the tutorium
  session.

#### Saving Loading

- use [FileAccess](https://docs.godotengine.org/en/stable/classes/class_fileaccess.html) to get handles to files
- [godot docs about the Filesystem](https://docs.godotengine.org/en/stable/tutorials/scripting/filesystem.html)
- [loading and saving with Godot](https://docs.godotengine.org/en/stable/tutorials/io/runtime_file_loading_and_saving.html)
	- [a blog post that has an opinion on how to do it](https://kidscancode.org/godot_recipes/4.x/basics/file_io/index.html)
	- [a video on why JSON bad for saving](https://www.youtube.com/watch?v=yuvliTJ6ATA)

You will normally need to handle 4 possible cases:

|              | Read File    | Write File                                                               |
|--------------|--------------|--------------------------------------------------------------------------|
| File Exists  | just read it | decide if you need to update onlyt specific contents / override / append |
| File Missing | decide       | create the file                                                          |

We created an example implementation in [Scripts/score_keeper.gd](Scripts/score_keeper.gd) during the tutorium session.

#### JSON

JSON is a data format godot can use ([docs](https://docs.godotengine.org/en/stable/classes/class_json.html))

```json
{
  "string_value": "cool string",
  "int_value": 1,
  "float_value": 1.0,
  "bool_value": true,
  "array_value": [
	"value0",
	1,
	2.0,
	[
      "nested_array"
	]
  ],
  "dict_value": {
	"nested_value": "cool value",
	"num": 1
  }
}
```

##### JSON to Godot

You can either directly parse the value

```gdscript
var value_to_read := """{ "string_value": "cool string", "int_value": 1 }"""
var data = JSON.parse_string(value_to_read) # returns null if parsing failed.
``` 

Or try to handle the error

```gdscript
# retrieve data
var value_to_read := """{ "string_value": "cool string", "int_value": 1 }"""
var json = JSON.new()
var error = json.parse(value_to_read)
if error == OK: # handle the error
	var data_received = json.data
	if typeof(data_received) == TYPE_ARRAY: # check that the type of the loaded data is correct
		print(data_received) # prints the array.
	else:
		print("Unexpected data")
else:
	print("JSON Parse Error: ", json.get_error_message(), " in ", value_to_read, " at line ", json.get_error_line())
```

##### Godot to JSON

```gdscript
var cool_data: Dictionary[String, Variant] = {
		"bruh": 1,
		"score": "2",
	}
var json_string = JSON.stringify(cool_data)
```

### Session 3.5

- Moving Platforms
	- you can easily create a moving platform using
	  the [AnimationPlayer](https://docs.godotengine.org/en/stable/classes/class_animationplayer.html)
		- [sprite animations](https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html#sprite-sheet-with-animationplayer)
		- [cutout / puppet animations](https://docs.godotengine.org/en/stable/tutorials/animation/cutout_animation.html)
		- you can animate almost every property in godot, this includes the position or the ratio in
		  a [Path2D](https://docs.godotengine.org/en/stable/classes/class_path2d.html)
		- this allows for easy synchronisation of platforms if they are all managed in the same animation track
		- this might be bad if the platforms need to move out of sync or some platforms move for a longer time than
		  others, because each animation has a fixed duration
		- this also has the problem that you cannot see the path of the platform in the editor
	- if you want to see the path of the platform in the editor, you can use
	  a [Path2D](https://docs.godotengine.org/en/stable/classes/class_path2d.html) and add
	  a [PathFollow2D](https://docs.godotengine.org/en/stable/classes/class_pathfollow2d.html#class-pathfollow2d) to it
		- this is useful for debugging and visualizing the path of the platform in the editor
		- you can live edit the path of the platform in the editor while the game is running and have the movement of
		  the platform update inside the running game without the need to restart the game
		- when you animate the `progress_ratio` (0-1 ratio along the path) or `progress` (length in pixles) of the
		  `PathFollow2D` with an `AnimationPlayer`, you can have the best of both worlds, easy sync of the platforms,
		  you see the path of the platform and for specific platforms you can easily handle them separetly
		- see also the example script for a self-moving platform
		  in [Scripts/self_moving_path_follow_2d.gd](Scripts/self_moving_path_follow_2d.gd)


### Session 4
TODO
- git
- C# setup

### Session 5 
- Text-Parsing
  - Some further reading
    - Grammar based parsing (very computer-sciency and only recommended if you like coding)
      - parsing by `Computerphile` (very much computer science and not really gamedev)
        - [Computerphile on text parsing](https://www.youtube.com/watch?v=bxpc9Pp5pZM) + [additional notes](https://www.youtube.com/watch?v=Airi85CPdPk)
        - [Computerphile on bottom up parsing](https://www.youtube.com/watch?v=tH5AOX9929g) + [additional notes](https://www.youtube.com/watch?v=jzpYiuD2ffo)
        - [Yoda Parsing](https://www.youtube.com/watch?v=ggxEzR2VRNU)
      - compiler basics by `Premature Abstraction`
        - [Lexer](https://www.youtube.com/watch?v=MBpMYTTEvLU)
        - [Parser](https://www.youtube.com/watch?v=HuSCzN5IPAo&pp=0gcJCQQLAYcqIYzv)
    - Giant Data-Tables
      - [talk about how a text adventure is structured internally](https://www.youtube.com/watch?v=II3O1CJA-x8) (describes how they were made back then within the limitations of the technology. Keep in mind that you will be able to simplify a lot of things with how fast computers are today.)
    - [Zork post-mortem](https://gdcvault.com/play/1020612/Classic-Game-Postmortem) (also the [Zork source code](https://github.com/historicalsource/zork-1))
    - [GMTK on Event[0]](https://www.youtube.com/watch?v=bCJw4hQkPj4) (a conceptual description of an intelligent pre LLM text parser)  
    - [blog post that explains how to build a simple text parser](https://www.lucashenkel.com/2017/03/starting-text-adventure/)
    - [full course on how to implement an adventure game](https://www.youtube.com/playlist?list=PLZHx5heVfgEvThLmdx7KySZhCrdvDLmeQ) (this is for Java and C#, you will need to translate the code patterns explained here to GDScript yourself.)

### Session X

- git
- C# events & Godot signals and callables
	- signal implementation in
	  godot: https://github.com/godotengine/godot/blob/3911e0963d39b79a85cb329340c6918397d2d05e/core/object/gdtype.cpp#L115
	- signal calling in
	  godot: https://github.com/godotengine/godot/blob/3911e0963d39b79a85cb329340c6918397d2d05e/core/object/object.cpp#L1199-L1203
	- c# delegates & events
	  explained https://www.pcreview.co.uk/threads/how-do-c-delegates-in-net-work-under-the-hood.2364930/
	- they basically work the same way internally

## Further reading

### Godot

- the official Godot documentation (https://docs.godotengine.org/en/stable/)
- tutorials for all things godot (https://www.gdquest.com/)
	- [interactive tutorials for gdscript](https://gdquest.github.io/learn-gdscript/)
- tutorial channel for setting up basic things in Godot ([Brackeys](https://www.youtube.com/@Brackeys/videos))
- state machines, what are they, how do they work, how do you implement one: https://www.youtube.com/watch?v=ExuzWQ077n4
- advanced tutorials regarding harder Godot concepts ([Godotneers](https://www.youtube.com/@godotneers/videos))
	- state charts and why they are cooler than state machines https://www.youtube.com/watch?v=E9h9VnbPGuw
	- [component based architecture](https://www.youtube.com/watch?v=W8gYHTjDCic)
	- G.U.I.D.E (input system)
		- [Part 1](https://www.youtube.com/watch?v=gNiiaNViaUg)
		- [Part 2](https://www.youtube.com/watch?v=lEBYnQC-vJw)
		- [Part 3](https://www.youtube.com/watch?v=RCKqouD9bPI)
- free assets you can use as **PLACEHOLDERS** ([Kenney](https://kenney.nl/assets?t=godot))
	- starter kits for easily getting started with simple Projects ([starter kits](https://kenney.nl/starter-kits))

### Platformers and stuff

- interactive video essay on platformer physics: https://gmtk.itch.io/platformer-toolkit
- the movement code of celeste is open source
	- Celeste:  https://github.com/NoelFB/Celeste
	- Celeste64: https://github.com/ExOK/Celeste64


- Komponenten-Basierte Architektur (gut für Schadenssysteme):
  Wie bereits gesagt, wenn du Fragen hast melde dich gerne bei mir auch außerhalb des Tutoriums

### Programming for Games

- more general game programming patterns (https://gameprogrammingpatterns.com/)

### CompSci

- [series on how computers work under the hood](https://www.youtube.com/playlist?app=desktop&list=PLzH6n4zXuckpwdGMHgRH5N9xNHzVGCxwf&cbrd=1)
