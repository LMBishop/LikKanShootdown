extends Sprite

func _ready():
	visible = false

func _on_player_dead():
	visible = true
	$AudioStreamPlayer.play()
	get_tree().paused = true
