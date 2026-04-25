extends CharacterBody2D


@export var speed := 300.0
@export var jump_velocity := -400.0
@onready var stinky_radius: Area2D = %StinkyRadius

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		# we increment the score on each jump
		ScoreKeeper.increment()
		print(ScoreKeeper.score)
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		# we slow down the character when it is not moving
		# by using move_toward() we get a smooth deceleration
		velocity.x = move_toward(velocity.x, 0., speed/ 10.)
	
	move_and_slide()