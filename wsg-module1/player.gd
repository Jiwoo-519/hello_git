extends CharacterBody2D

const WALKING_SPEED: float = 210.0
const FRICTION: float = 0.95


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_UP):
		direction.y -= WALKING_SPEED
	if Input.is_key_pressed(KEY_DOWN):
		direction.y += WALKING_SPEED
	if Input.is_key_pressed(KEY_LEFT):
		direction.x -= WALKING_SPEED
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x += WALKING_SPEED

	direction = direction.normalized()

	# Move in the input direction instantly
	if direction != Vector2.ZERO:
		velocity = direction * WALKING_SPEED
	else:
		# Slowly reduce speed when no input
		velocity *= FRICTION

	move_and_slide()
