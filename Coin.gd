extends StaticBody2D

var timer

func _ready():
	timer = Timer.new()
	get_parent().add_child(timer)
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start(5.0)

func _on_timer_timeout() -> void:
	queue_free()
