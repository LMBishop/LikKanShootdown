extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_coin_hit():
	score += 1
	self.text = str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
