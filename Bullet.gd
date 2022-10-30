extends KinematicBody2D
export (int) var speed = 2000

var velocity = Vector2()
var target = Vector2.ZERO
#var player = load("")
var shot = false;
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	target = get_global_mouse_position()
	velocity = global_position.direction_to(target) * speed
	position += velocity * 0.05

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider and "Enemy" in collision.collider.get_name():
			collision.collider.free()
	if velocity == Vector2(0.0, 0.0):
		queue_free()
	if position.x > screen_size.x or position.x < 0 or position.y > screen_size.y or position.y < 0:
		queue_free()



