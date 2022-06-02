extends KinematicBody2D

var velocity = Vector2.ZERO

export (int) var speed = 100
export (int) var jump_speed = -200
export (int) var gravity = 500

func _physics_process(delta):

	velocity.x = 0
	if Input.is_action_pressed("walk_right"):
		$AnimatedSprite.flip_h = false
		velocity.x += speed
		
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
		$AnimatedSprite.flip_h = true
		
	if velocity.x == 0:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "walk"

	velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
	if not is_on_floor():
		$AnimatedSprite.animation = "jump"
	
	velocity = move_and_slide(velocity, Vector2.UP)
