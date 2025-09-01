extends Area2D
signal hit
var velocity = Vector2.ZERO
func _physics_process(delta):
	position += velocity * delta
func _on_body_entered(body: Node2D) -> void:
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
