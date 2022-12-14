extends ProgressBar

signal player_dead

func _ready():
	connect("player_dead", get_node("/root/Main/HUD/GameOver"), "_on_player_dead")

func _on_player_hit(delta):
	value -= delta * 20
	var styleBox = self.get("custom_styles/fg")
	styleBox.bg_color = Color.from_hsv((value) / 300, 1.0, 1.0)
	if value == 0:
		emit_signal("player_dead")
