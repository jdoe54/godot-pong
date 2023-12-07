extends Node2D

var win = 0
var lost = 0
var new_ball
var game_on = true


const START_X = 566
const START_Y = 332

func _reset(ball):
	if ball != null and game_on == true:
		game_on = false
		$Score.play()
		
		var new_ball = ball.duplicate()
		
		await get_tree().create_timer(5.0).timeout
		ball.queue_free()
		
		add_child(new_ball)
		new_ball.position = Vector2(START_X, START_Y)
		new_ball.set_name("Ball")
		
		await get_tree().create_timer(1.0).timeout
		
		game_on = true
		
		
		

	

func _on_player_wall_body_entered(body):
	if body.name == "Ball" || body.name == "Ball2":
		if game_on == true:
			lost = lost + 1
			_reset(body)
	


func _on_enemy_wall_body_entered(body):
	if body.name == "Ball" || body.name == "Ball2":
		if game_on == true:
			win = win + 1
			_reset(body)

func _process(delta):
	$Player1Score.text = str(win)
	$Player2Score.text = str(lost)
