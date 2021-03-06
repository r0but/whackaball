extends Node2D

var player_1_score = 0
var player_2_score = 0

var p1_start = Vector2()
var p2_start = Vector2()
var ball_start = Vector2()

func _ready():
	set_fixed_process(true)
	
	p1_start = get_node("player_1").get_pos()
	p2_start = get_node("player_2").get_pos()
	ball_start = get_node("kinematic_ball").get_pos()
	
	game_reset()
	
	# probably shouldn't handle this stuff here but w/e here it is
	var p2_texture = preload("res://assets/p_red.png")
	get_node("player_2").set_controller(2)
	get_node("player_2/person_sprite").set_texture(p2_texture)

func _fixed_process(delta):
	if get_node("kinematic_ball").get_pos().x < 0:
		player_2_score += 1
		get_node("player_2_score").set_text(str(player_2_score))
		ball_reset()
	elif get_node("kinematic_ball").get_pos().x > 1800:
		player_1_score += 1
		get_node("player_1_score").set_text(str(player_1_score))
		ball_reset()
	if Input.is_action_pressed("ui_newgame"):
		game_reset()

func game_reset():
	player_1_score = 0
	player_2_score = 0
	get_node("player_1_score").set_text(str(player_1_score))
	get_node("player_2_score").set_text(str(player_2_score))
	get_node("player_1").set_pos(p1_start)
	get_node("player_2").set_pos(p2_start)
	ball_reset()

func ball_reset():
	get_node("kinematic_ball").set_pos(ball_start)
	get_node("kinematic_ball").move_vector = Vector2(0, -75)