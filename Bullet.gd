extends KinematicBody2D
export (int) var speed = 2000

var velocity = Vector2()
var target = Vector2.ZERO
#var player = load("")
var shot = false;
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




	target = get_global_mouse_position()
	if(Input.is_action_pressed("click")  && shot == false):
		velocity = global_position.direction_to(target) * speed
		shot = true
	velocity = move_and_slide(velocity)




