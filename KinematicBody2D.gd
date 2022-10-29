extends KinematicBody2D

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

func _physics_process(delta):
	


	get_input()
	globals.playerPos = global_position
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("click"):
		var obj = spawn_object.instance()
		obj.position = get_position()
		obj.position.x -= 500		
		obj.position.y -= 250
		add_child(obj)
