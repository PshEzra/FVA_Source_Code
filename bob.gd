extends Node2D

var get_item = true

var picked_up : Node2D = null

func _process(delta):
	if $bobit.has_overlapping_bodies() && picked_up == null && get_item == true:
		var main = $bobit.get_overlapping_bodies()[0]
		picked_up = main
		picked_up.col(false)
		main.get_parent().remove_child(picked_up)
		add_child(picked_up)
		picked_up.global_position = global_position
	
	if picked_up != null:
		picked_up.global_position = global_position
