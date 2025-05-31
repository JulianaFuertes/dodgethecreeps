extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func showmessage(text):
	pass # Replace with function body.

	$MessageLabel.text= text
	$MessageLabel.show()
	$MessageTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func gameover():
	pass
	showmessage("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge\nthe\nCreeps"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_start_button_pressed() -> void:
	pass # Replace with function body.
	$StartButton.hide()
	emit_signal("start_game")

func _on_message_timer_timeout() -> void:
	pass # Replace with function body.
	$MessageLabel.hide()
