extends KinematicBody2D

var velocity = Vector2.ZERO

export (int) var speed = 100
export (int) var jump_speed = -200
export (int) var gravity = 500
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

func _physics_process(delta):

	var dir = 0
	if Input.is_action_pressed("walk_right"):
		$AnimatedSprite.flip_h = false
		dir += 1
		
	if Input.is_action_pressed("walk_left"):
		$AnimatedSprite.flip_h = true
		dir -= 1
		
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
	if abs(velocity.x) < 30:
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
