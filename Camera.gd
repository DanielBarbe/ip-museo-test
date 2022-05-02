extends Sprite

var camera_rotation_degrees = 0
var rotation_degrees_count = 0
var direction = 1
var movement_speed = 0.5

func _ready():
	pass # Replace with function body.

func _process(delta):
	
	rotation_degrees_count += direction * (movement_speed + delta)
	
	if rotation_degrees_count > -45 and rotation_degrees_count < 45:
		camera_rotation_degrees = rotation_degrees_count 
	
	if rotation_degrees_count >= 45:
		camera_rotation_degrees = 45
	if rotation_degrees_count > 65:
		direction = -1
	if rotation_degrees_count <= -45:
		camera_rotation_degrees = -45
	if rotation_degrees_count < -65:
		direction = 1
	
	self.rotation_degrees = camera_rotation_degrees

func _on_Area2D_body_entered(body):
	print(body)
