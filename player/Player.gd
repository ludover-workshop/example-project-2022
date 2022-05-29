extends KinematicBody2D

var velocity = Vector2.ZERO

export (int) var speed = 100


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
	
	velocity = move_and_slide(velocity, Vector2.UP)
