extends CharacterBody2D

@onready var muzzel = $body/muzzel
@onready var tank = null
@onready var enemy = preload("res://enemy_tank.tscn")
@export var speed = 100

func _ready():
	tank = get_tree().root.find_child("tank", true, false)

func _process(delta):
	muzzel.look_at(tank.global_position)
	muzzel.rotation += 3.14/2
	
	var direction = (tank.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	
