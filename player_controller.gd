extends Node2D

var is_reeling = false
var is_return = false

@onready var audio = $AudioStreamPlayer2D

@export var bob : PackedScene
@onready var bob_launch_pos = $fishing_point

var then_pos = null
@onready var new_bob : Node2D = $Bob

var bob_speed = 800

var taken_item = null

@onready var line : Line2D = $Line2D

func _ready():
	line.add_point(position)
	audio.volume_db = -100
	line.add_point(new_bob.position)

func _process(delta):
	if !is_reeling:
		look_at(get_global_mouse_position())
	fishing(delta)
	line.set_point_position(1, new_bob.position)

func fishing(delta):
	if Input.is_action_just_pressed("fish") && !is_reeling:
		then_pos = get_global_mouse_position()
		is_reeling = true
		audio.volume_db = 1
		
	if is_reeling && !is_return:
		new_bob.global_position = new_bob.global_position.move_toward(then_pos, delta*bob_speed)
	
		if new_bob.global_position.distance_to(then_pos) < 1:
			if new_bob.picked_up != null && !new_bob.get_item:
				var temp = new_bob.picked_up
				new_bob.remove_child(temp)
				get_parent().add_child(temp)
				temp.col(true)
				temp.global_position = new_bob.global_position
				new_bob.picked_up = null
			is_return = true
			
	if is_reeling && is_return:
		new_bob.global_position = new_bob.global_position.move_toward(bob_launch_pos.global_position, delta*bob_speed)
		if new_bob.global_position.distance_to(bob_launch_pos.global_position) < 1:
			if new_bob.picked_up == null && !new_bob.get_item:
				new_bob.get_item = true
			if new_bob.picked_up != null:
				new_bob.get_item = false
			is_reeling = false
			is_return = false
			audio.volume_db = -100
	
