extends RigidBody2D

var MIN_SPEED = 150
var MAX_SPEED = 250
var mob_types = ["fly", "walk", "swim"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	$AnimatedSprite2D.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	pass # Replace with function body.
	
	queue_free()
