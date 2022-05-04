extends Sprite

var raycast
var target = null
var count = 0
var direction = -1
var movement_speed = 1.5
var spawn_position

func _ready():
	raycast = $RayCast2D

func _process(delta):

	count += abs(direction * movement_speed)
	
	if count < 350:
		self.global_position.x += (direction * movement_speed)
	if count > 550:
		count = 0
		direction *= -1
		self.scale.x *= -1

	if target != null:
		raycast.set_cast_to(to_local(target.global_position))
		raycast.enabled = true
		if raycast.is_colliding() && raycast.get_collider() == target:
			target.respawn_player()
			
func _on_Area2D_body_entered(body):
	if target == null:
		target = body
		
func _on_Area2D_body_exited(body):
	if target == body:
		target = null
		raycast.enabled = false
