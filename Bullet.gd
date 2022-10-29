extends KinematicBody2D
export (int) var speed = 2000

var velocity = Vector2()
var target = Vector2.ZERO
#var player = load("")
var shot = false;


func _physics_process(delta):
	target = get_global_mouse_position()
	if(Input.is_action_pressed("click")  && shot == false):
		velocity = global_position.direction_to(target) * speed
		shot = true
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider:
			collision.collider.free()
	if velocity == Vector2(0.0, 0.0):
		queue_free()



