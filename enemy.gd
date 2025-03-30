extends CharacterBody2D

@onready  var player = get_node("/root/Game/Player")
var speed = 15000.0

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed * delta
	move_and_slide()
