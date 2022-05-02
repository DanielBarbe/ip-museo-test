extends KinematicBody2D
class_name Player

export (float) var ACCELERATION:float = 20.0
export (float) var H_SPEED_LIMIT:float = 600.0
export (float) var FRICTION_WEIGHT:float = 0.1
export (float) var JUMP_SPEED:float = -500.0 
export (float) var GRAVITY:float = 15

var velocity:Vector2 = Vector2.ZERO

func _get_input():

	# Player movement
	var h_movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))

	if h_movement_direction != 0:
		velocity.x = clamp(velocity.x + (h_movement_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0

	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED

func _physics_process(delta):
	_get_input()
	
	velocity.y += GRAVITY
	move_and_slide(velocity, Vector2.UP)	
