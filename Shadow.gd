extends Sprite

func _on_Area2D_body_entered(body):
	body.set_collision_layer_bit(1, false)

func _on_Area2D_body_exited(body):
	body.set_collision_layer_bit(1, true)
