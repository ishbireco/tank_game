extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var shot = preload("res://shot.tscn")

#movement mechanic

func _process(delta: float) -> void:
	muzzel.look_at(get_global_mouse_position())
	muzzel.rotation += 3.14/2 
	
	muzzel.rotation_degrees = clamp(muzzel.rotation_degrees,-50,50)
	
	if Input.is_action_pressed("shoot"):
		var shot_inst = shot.instantiate()
		get_tree().root.add_child(shot_inst)
		shot_inst.global_position = muzzel.global_position
		shot_inst.rotation = muzzel.rotation
