class_name SelfMovingPathFollow2D
extends PathFollow2D

## the amount of time it takes for the platform to finish moving along the path
@export_range(.1, 10.) var seconds_to_finished := 2.
## if true the mover changes the movement direction if it reaches the end of the parent path
@export var bonce := true

## track the number of seconds (counts up to seconds_to_finished and then back down)
var _seconds_passed := 0.
## track the direction of the platform
var _direction := 1

func _physics_process(delta: float) -> void:
	# calcualte the seconds after the move if the platform didn't change direction
	var seconds_after := _seconds_passed + (_direction * delta)
	# would the platform move farther then the max or back below 0?
	if seconds_after >= seconds_to_finished or seconds_after <= 0.:
		# reverse direction
		_direction = _direction * -1 
	
	# calculare the actual amount of seconds passed
	_seconds_passed =_seconds_passed + (delta * _direction)
	
	# calculate how far along the platform is in the ratio between 0 (start) and 1 (end)
	self.progress_ratio = _seconds_passed / seconds_to_finished
