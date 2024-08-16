extends Area2D

@export var acc_type : bool
var incorrect = 0
var total = 0

@export var sprite : Node2D
@export var game_manager : Node2D
@onready var audio : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body):
	
	if body.is_funny == acc_type:
		print("Correct!")
		if acc_type:
			sprite.laugh()
			add_score()
	else:
		print("Wrong!")
		incorrect += 1
		if acc_type:
			sprite.cringe()
			watched_bad_vid()
	total += 1
	body.get_parent().remove_child(body)

func add_score():
	audio.play()
	game_manager.update_score(1)
	pass
	
func watched_bad_vid():
	audio.play()
	game_manager.got_wrong()
