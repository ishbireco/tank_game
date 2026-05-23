extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var shot = preload("res://shot.tscn")
var can_shoot : bool
@onready var sheild = $Area2D

#movement mechanic

func _process(delta: float) -> void:
	muzzel.look_at(get_global_mouse_position())
	muzzel.rotation += 3.14/2 
	
	muzzel.rotation_degrees = clamp(muzzel.rotation_degrees,-50,50)
	
	if Input.is_action_pressed("shoot"):
		shield_check()
		shoot_timer()
		
		
func shoot_timer():
	if can_shoot == true and Input.is_action_pressed("shoot"):
		var shot_inst = shot.instantiate()
		get_tree().root.add_child(shot_inst)
		shot_inst.global_position = muzzel.global_position
		shot_inst.rotation = muzzel.rotation
		can_shoot = false
	
	await get_tree().create_timer(0.6).timeout
	can_shoot = true
	
func shield_check():
	if sheild.visible == true:
		can_shoot = false
	elif sheild.visible == false:
		can_shoot = true
		
		
