extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_dead

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("player_dead", get_node("/root/Main/HUD/Wordart"), "_on_player_dead")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_player_hit(delta):
	value -= delta * 20
	var styleBox = self.get("custom_styles/fg")
	styleBox.bg_color = Color.from_hsv((value) / 300, 1.0, 1.0)
	if value == 0:
		emit_signal("player_dead")
