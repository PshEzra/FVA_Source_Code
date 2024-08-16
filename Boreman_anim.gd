extends Sprite2D

@onready var anim : AnimationTree = $AnimationTree
@onready var laughing_sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var gross_sound : AudioStreamPlayer2D = $disgusted

func laugh():
	anim.set("parameters/conditions/laughing", true)
	await get_tree().create_timer(0.1).timeout
	anim.set("parameters/conditions/laughing", false)
	laughing_sound.play()
	pass

func cringe():
	anim.set("parameters/conditions/cringe", true)
	gross_sound.play()
	await get_tree().create_timer(0.1).timeout
	anim.set("parameters/conditions/cringe", false)
	pass
