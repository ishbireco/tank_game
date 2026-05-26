extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var enemy = preload("res://scenes/enemy_tank.tscn")
@export var speed = 100
@export var enemy_bullet = preload("res://scenes/enemy_shot.tscn")
@export var time_curve : Curve
var max_score = 100
var can_shoot = true
var is_moving = true


func shoot():
	if can_shoot == true:
		var bullet_inst = enemy_bullet.instantiate()
		bullet_inst.global_position = muzzel.global_position
		bullet_inst.rotation = muzzel.rotation
		get_tree().root.add_child(bullet_inst)
		can_shoot = false
		
	var ratio = float(GlobalScore.score)/max_score
	await  get_tree().create_timer(1 * time_curve.sample(ratio)).timeout
	can_shoot = true

func _process(delta):
	var real_tank = get_tree().get_nodes_in_group("player")
	var tank = real_tank[0]
	muzzel.look_at(tank.global_position)
	muzzel.rotation += 3.14/2
	
	if is_moving == true:
		var direction = (tank.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	if can_shoot == true:
		shoot()
		

	
