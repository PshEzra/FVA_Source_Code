extends Node2D

@onready var total_label : Label = $watched
@onready var eval_label : Label = $Label2

func _ready():
	total_label.text = str(TotalFunny.submitted_funny) + " Funny Videos Watched"
	comment_setter()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://game_world.tscn")

func comment_setter():
	if TotalFunny.submitted_funny < 10:
		eval_label.text = "EVAL : The Recommender seems broken. We should probably make a new one"
	elif TotalFunny.submitted_funny >= 10 && TotalFunny.submitted_funny < 30:
		eval_label.text = "EVAL : The Recommender performed quite poorly. We will need to work on it"
	elif TotalFunny.submitted_funny >= 30 && TotalFunny.submitted_funny < 50:
		eval_label.text = "EVAL : The Recommender performed at an under average quality. We need to work on it a little bit more"
	elif TotalFunny.submitted_funny >= 30 && TotalFunny.submitted_funny < 50:
		eval_label.text = "EVAL : The Recommender worked quite well! Im so happy with how it worked out"
	elif TotalFunny.submitted_funny >= 50 && TotalFunny.submitted_funny < 100:
		eval_label.text = "EVAL : The Recommender worked REALLY well! Our app usage time is gonna skyrocket!"
	elif TotalFunny.submitted_funny >= 100:
		eval_label.text = "EVAL : This worked beyond our expectations! We're gonna make so much money with this app!"


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://start_scene.tscn")
