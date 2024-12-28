extends Node2D

var fuzzy = preload("res://fuzzy.tscn")
var fuzzy_ins
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D/Label.text = str("Score = ") + str(score)
	$Camera2D.position.y -= 10 * delta
	$Marker2D.position.y -= 10 * delta


func _on_timer_timeout() -> void:
	fuzzy_ins = fuzzy.instantiate()
	fuzzy_ins.position = Vector2(randf_range(100,980),$Marker2D.position.y)
	add_child(fuzzy_ins)
	score+=1
