extends Sprite

var camera_rotation_degrees = 0
var rotation_degrees_count = 0
var direction = 1
var movement_speed = 0.5
var target = null
var raycast
var count = 0

func _ready():
	raycast = $RayCast2D

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
	
	if target != null:
		raycast.set_cast_to(to_local(target.global_position))
		raycast.enabled = true
		if raycast.is_colliding() && raycast.get_collider() == target:
			count = (count + 1) % 60
			print(str(count) + " " + str(target))

func _on_Area2D_body_entered(body):
	if target == null:
		target = body
		raycast.enabled = true
		
func _on_Area2D_body_exited(body):
	if target == body:
		target = null
		raycast.enabled = false	
