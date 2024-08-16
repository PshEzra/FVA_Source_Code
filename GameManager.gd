extends Node2D

@export var upper : Node2D
@export var lower : Node2D

@export var score_disp : Label
@export var wrong_disp : Label

var total = 0
var score = 0

var mistakes = 0

func update_score(updt):
	score += updt
	score_disp.text = "Viewed " + str(score) + " Funny Videos"

func got_wrong():
	mistakes = upper.incorrect
	wrong_disp.text = str(mistakes) + " Videos are Not Funny..."
	
	if upper.incorrect >= 5:
		change_scene()

func change_scene():
	#await get_tree().create_timer(2).timeout
	total = upper.total + lower.total
	TotalFunny.total_funny = lower.incorrect + (upper.total - upper.incorrect)
	TotalFunny.submitted_funny = score
	get_tree().change_scene_to_file("res://end_scene.tscn")
