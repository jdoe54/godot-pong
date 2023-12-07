extends CharacterBody2D

var speed = 600
var direction = Vector2.ZERO

func _ready():
	randomize()
	direction.y = [-1,1][randi() % 2]
	direction.x = [-0.8,0.8][randi() % 2]
	
	velocity = direction * speed
	
func _physics_process(delta):

	
	var collide = move_and_collide(velocity * delta)
	if collide != null:
		
		
		velocity = velocity.bounce(collide.get_normal()) * 1.05
		var ball_sound = $BallHit
		ball_sound.play(0.2)
	
	
