extends Area2D

signal hit
var screen_size
export (int) var speed = 200
var spawn_object = load("res://Bullet.tscn")
var velocity = Vector2()
onready var globals = get_node("/root/Global")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	get_input()
	globals.playerPos = global_position
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if Input.is_action_just_pressed("click"):
		var obj = spawn_object.instance()
		obj.position = get_position()
		get_owner().add_child(obj)
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.get_name() != "Bullet":
			emit_signal("hit", delta)
