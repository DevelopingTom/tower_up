extends Camera2D

const MOVE_SPEED = 300
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		position.x += MOVE_SPEED * delta
	if Input.is_action_pressed("left"):
		position.x -= MOVE_SPEED * delta
	if Input.is_action_pressed("up"):
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed("down"):
		position.y += MOVE_SPEED * delta
	pass
