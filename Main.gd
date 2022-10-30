extends Node2D

export(PackedScene) var enemy_scene
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	get_node("Player").connect("hit", get_node("HUD/HBoxContainer/HealthBar"), "_on_player_hit")
	get_node("Player").connect("coin", get_node("HUD/HBoxContainer/CoinCount"), "_on_coin_hit")
	get_node("Player").connect("coin", get_node("HUD/GameOver/GameOverCoinMessage/GameOverCoinCount"), "_on_coin_hit")
	$EnemySpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemySpawnTimer_timeout():
	var enemy = enemy_scene.instance()
	var spawn_loc = get_node("EnemySpawn/EnemySpawnLocation")
	spawn_loc.offset = randi()
	enemy.position = spawn_loc.position
	add_child(enemy)
