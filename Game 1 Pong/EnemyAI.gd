extends CharacterBody2D

var speed = 600;


func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if (Input.is_action_pressed("ui_up")):
		velocity = Vector2.UP * speed
	elif (Input.is_action_pressed("ui_down")):
		velocity = Vector2.DOWN * speed
	
	move_and_slide()

	
