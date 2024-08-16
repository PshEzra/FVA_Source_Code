extends Area2D

@export var speed : float

func _ready():
	slight_increase()

func _on_body_entered(body):
	body.linear_velocity = Vector2(50, 0)

func _on_body_exited(body):
	body.linear_velocity = Vector2(0,0)
	
func _physics_process(delta):
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			body.linear_velocity = Vector2(speed, 0)
			
func slight_increase():
	await get_tree().create_timer(5.0).timeout
	speed += 10
	print(speed)
	slight_increase()
