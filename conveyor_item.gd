extends RigidBody2D

@export var is_funny : bool
@export var images : Array[Sprite2D]
@onready var colision : CollisionShape2D = $CollisionShape2D

func _ready():
	var rand = randi_range(0, len(images)-1)
	
	print("Num " + str(rand))
	
	for i in range(len(images)):
		if i != rand:
			images[i].hide()

func col(cond : bool):
	colision.disabled = !cond
