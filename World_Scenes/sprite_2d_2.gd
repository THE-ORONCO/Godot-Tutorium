extends Sprite2D

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"




func _on_timer_timeout() -> void:
	self.frame = (self.frame +1 )% (self.hframes * self.vframes)
