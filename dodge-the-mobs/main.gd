extends Node
@export var mob_scene: PackedScene
func _ready():
	new_game()
func new_game():
	$MobTimer.start()
func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $Path2D/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var velocity_vector = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.velocity = velocity_vector.rotated(direction)
	mob.velocity = velocity_vector.rotated(direction)
	mob.hit.connect(game_over)
	add_child(mob)
func game_over():
	$MobTimer.stop()
	$Player.hide()
