extends CharacterBody2D


@export var speed := 100.0

## on load define a random direction by multiplying a random number between [0,1]. Then we shift it over by 0.5 to 
## move the range of values to [-0.5, 0.5]. By then multiplying it by 2 we get a range of values between [-1, 1.]
var direction := (randi_range(0,1) - .5) * 2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity()
	
	# we move the character in a random direction by the speed by setting its horizontal velocity
	velocity.x = speed * direction

	move_and_slide()


## on timeout we change the direction to a random one
func _on_timer_timeout() -> void:
	direction = (randi_range(0,1) - .5) * 2
