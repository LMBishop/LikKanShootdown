extends KinematicBody2D

onready var globals = get_node("/root/Global")

func _process(delta):
	move_and_collide(global_position.direction_to(globals.playerPos).normalized() * 300 * delta)
