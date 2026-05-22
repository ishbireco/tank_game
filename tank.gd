extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var shot = preload("res://shot.tscn")
@onready var shotMark = $body/muzzel/shotMark
@export var shotSpeed = 200

#movement mechanic

func _process(delta: float) -> void:
	muzzel.look_at(get_global_mouse_position())
	muzzel.rotation += 3.14/2 
	
	muzzel.rotation_degrees = clamp(muzzel.rotation_degrees,-50,50)
	
#input check
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		spawn_and_shoot_shot()
		
#spawn and give speed
	
func spawn_and_shoot_shot():
	var new_shot = shot.instantiate()
	get_parent().add_child(new_shot)
	new_shot.global_position = shotMark.global_position
	
	
