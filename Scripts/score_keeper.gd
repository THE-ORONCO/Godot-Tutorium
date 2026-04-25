extends Node

var score: int = 0

func increment() -> void:
	score += 1

const path:String = "user://save-data.json"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("load"):
		var content: String
		if FileAccess.file_exists(path):
			var file:= FileAccess.open(path, FileAccess.READ)
			content = file.get_as_text()
			file.close()
		else:
			var file:= FileAccess.open(path, FileAccess.WRITE_READ)
			file.store_line("{}")
			file.flush()
			content = file.get_as_text()
			file.close()
		print(content)
	
	if Input.is_action_just_pressed("save"):
		if FileAccess.file_exists(path):
			var file:= FileAccess.open(path, FileAccess.READ_WRITE)
			var text := file.get_as_text()
			print_debug(text)
			var dict = JSON.parse_string(text)
			print_debug(dict)
			dict.set("score", score)
			print_debug(dict)
			var as_string := JSON.stringify(dict)
			print_debug(as_string)
			file.resize(0)
			print_debug(file.get_as_text())
			file.store_line(as_string)
			file.close()
		else:
			var file:= FileAccess.open(path, FileAccess.WRITE)
			var dict := {"score": score}
			var as_string := JSON.stringify(dict)
			file.store_line(as_string)
			file.close()
