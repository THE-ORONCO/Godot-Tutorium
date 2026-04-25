## This script keeps track of the score.
## It was added as an Autoload script in the Godot project settings under the "Autoloads" tab.
extends Node

## The score. It is accessible from everywhere using `ScoreKeeper.score`.
var score: int = 0

## Increments the score by one.
func increment() -> void:
	score += 1

## The path to the save file. This is fixed and points to the save file in the user folder.
## In windows this is `C:\Users\<username>\AppData\Roaming\Godot\<project-name>\save-data.json`.
## In linux this is `/home/<username>/.config/<project-name>/save-data.json`.
## In macOS this is `~/Library/Application Support/<project-name>/save-data.json`.
const path:String = "user://save-data.json"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("load"):
		_load_save_file()
	
	if Input.is_action_just_pressed("save"):
		_save_save_file()

func _load_save_file() -> void:
	var content: String
	# Case: load + file exists
	if FileAccess.file_exists(path): 
		print("save file exists, we will read it")
		# get a handle to the file with the READ flag that will allow us to only read the file without modifying it
		var file:= FileAccess.open(path, FileAccess.READ)
		# get all contents of the file as text (a multi line string)
		content = file.get_as_text()
		file.close()
		
	# Case: load + file missing
	else:
		print("save file does not exist, we will create it")
		var file:= FileAccess.open(path, FileAccess.WRITE_READ)
		file.store_line("{}")
		file.flush() # push the changes made to the file to disk
		content = file.get_as_text() 
		print("\tthe contents of the file after creating it:", content)
		file.close()
	
	print("loaded the save file")
	
		
func _save_save_file() -> void:
	# Case: write + file exists (we decide to completely overwrite the file)
	if FileAccess.file_exists(path):
		print("save file exists, we will overwrite it")
		
		# get a handle to the file with the READ_WRITE flag that will allow us to read and write to it without truncating it
		var file:= FileAccess.open(path, FileAccess.READ_WRITE)
		# write the contents
		var text := file.get_as_text()
		print("\tthe value we read from the file", file ,":", text)
		
		# parse the string into a dictionary
		var dict = JSON.parse_string(text)
		if dict == null:
			printerr("\terror parsing the save file")
			dict = {}
		else:
			print("\tthe parsed value in the file", dict)
			
		dict.set("score", score)
		print("\tthe updated value", dict)
		
		# convert the dictionary back to a string
		var as_string := JSON.stringify(dict)
		print("\tthe value converted back to string", as_string)
		
		# clear the file and write the new value
		file.resize(0)
		print("\tthe contents of the file after clearing it:", file.get_as_text())
		file.store_line(as_string)
		file.close()
		
	# Case: write + file missing
	else:
		print("save file does not exist, we will create it")
		# construct the dictionary with the values we need
		var dict := {"score": score}
		# convert the dictionary to a string
		var as_string := JSON.stringify(dict)
		
		# save the string to the file
		var file:= FileAccess.open(path, FileAccess.WRITE)
		file.store_line(as_string)
		file.close()
		
	print("saved the save file")