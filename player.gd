extends CharacterBody2D

signal health_depleted

var speed = 600.0
var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed 
	move_and_slide()

	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	if overlapping_enemies.size() > 0:
		health -= overlapping_enemies.size() * DAMAGE_RATE * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
