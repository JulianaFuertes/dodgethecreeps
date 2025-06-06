extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func new_game():
	pass
	
	score = 0
	$Player.start($Marker2D.position)
	$StartTimer.start()
	$HUD.showmessage("Get Ready")
	$HUD.update_score(score)


func game_over() -> void:
	pass # Replace with function body.
	
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.gameover()

func _on_start_timer_timeout() -> void:
	pass # Replace with function body.
	
	$ScoreTimer.start()
	$MobTimer.start()
	
func _on_score_timer_timeout() -> void:
	pass # Replace with function body.
	score += 1
	$HUD.update_score(score)

func _on_mob_timer_timeout() -> void:
	pass # Replace with function body.
	
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node(^"MobPath/MobSpawn")
	mob_spawn_location.progress = randi()

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
