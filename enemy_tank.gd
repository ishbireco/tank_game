extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var enemy = preload("res://enemy_tank.tscn")
@export var speed = 100
@export var enemy_bullet = preload("res://enemy_shot.tscn")
var can_shoot = true

	
func shoot():
	if can_shoot == true:
		var bullet_inst = enemy_bullet.instantiate()
		bullet_inst.global_position = muzzel.global_position
		bullet_inst.rotation = muzzel.rotation
		get_tree().root.add_child(bullet_inst)
		can_shoot = false
	
	await  get_tree().create_timer(2).timeout
	can_shoot = true

func _process(delta):
	var real_tank = get_tree().get_nodes_in_group("player")
	var tank = real_tank[0]
	muzzel.look_at(tank.global_position)
	muzzel.rotation += 3.14/2
	
	var direction = (tank.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	if can_shoot == true:
		shoot()
		

	
