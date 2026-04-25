## This global increases the score every second
extends Node2D


func _on_timer_timeout() -> void:
	ScoreKeeper.increment()
