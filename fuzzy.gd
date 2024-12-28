extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var can_move = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_pressed("left") and can_move:
		position.x -= 300 * delta
	if Input.is_action_pressed("right") and can_move:
		position.x += 300 * delta

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	can_move = false
	if area.is_in_group("wall"):
		get_tree().change_scene_to_file("res://ded.tscn")
