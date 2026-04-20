extends Node2D


@onready var area_2d: Area2D = $Area2D
const TEST_WORLD_2 : PackedScene = preload("res://World_Scenes/test_world2.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body is CharacterBody2D:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_packed.call_deferred(TEST_WORLD_2)
