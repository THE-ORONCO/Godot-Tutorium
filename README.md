# A small jump and run for the tutorium

## Contents

### Notes on AI

If you want to use AI please use the [AGENTS.md](AGENTS.md) file. Solving the problems is the thing you should try to
learn. Letting the AI solve everything does not help you learn the process. When you use it do it as a question partner.

## Sessions

### Session 1

- the basics of Godot and how to create a 2D jump and run player character

### Session 2

- collision & layers & masks
	- [official docs](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#collision-layers-and-masks)
	- [video](https://www.youtube.com/watch?v=YPZQM6w7rlI)
- scene loading
  - via the simple `change_scene_to_file(...)`, `change_scene_to_packed(...)`, `change_scene_to_node(...)`  ([docs](https://docs.godotengine.org/en/stable/tutorials/scripting/change_scenes_manually.html))
  - [background loading for chunk based levels](https://docs.godotengine.org/en/stable/tutorials/io/background_loading.html)

### Session 3

- git

### Session X

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
