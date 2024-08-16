extends Node2D

@export var spawnables : Array[PackedScene]

@export var spawn_places : Array[Node2D]

var coin = true

var total = 0
var total_waves = 0

var wait = 2.0

func _ready():
	spawn()
	
func spawn():
	await get_tree().create_timer(wait).timeout
	for i in range(randi_range(1,3)):
		total += 1
		var y_offset = randf_range(-100, 100)
		
		var spawn = spawnables[randi_range(0,1)].instantiate()
		var spawnpos : Vector2 = Vector2()
		
		if coin:
			spawnpos = spawn_places[0].global_position
			
		else:
			spawnpos = spawn_places[1].global_position
			
		spawnpos.y = spawnpos.y - y_offset
		
		get_parent().add_child(spawn)
		spawn.global_position = spawnpos
		coin = !coin
	total_waves += 1
	if total_waves > 10:
		wait = wait * 0.95
		total_waves = 0
	spawn()
	
