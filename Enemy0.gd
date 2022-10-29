extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# var player = get_node("")
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(global_position.direction_to(globals.playerPos).normalized() * 1000 * delta)
