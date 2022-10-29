extends Node2D

export(PackedScene) var enemy_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	get_node("KinematicBody2D").connect( "hit", get_node("HUD/HBoxContainer/HealthBar"), "_on_player_hit")
	$EnemySpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemySpawnTimer_timeout():
	var enemy = enemy_scene.instance()
	var spawn_loc = get_node("EnemySpawn/EnemySpawnLocation")
	spawn_loc.offset = randi()
	#var direction = spawn_loc.rotation + PI / 2
	enemy.position = spawn_loc.position
	#enemy.rotation = enemy.position.angle_to_point(globals.playerPos)
	#var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	#enemy.linear_velocity = velocity.rotated(direction)
	add_child(enemy)
