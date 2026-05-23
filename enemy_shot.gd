extends Area2D

@export var speed = 200
@export var tank = preload("res://tank.tscn")
@onready var shield = preload("res://shield.tscn")

func _process(delta: float) -> void:
	global_position -= transform.y * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://death_menu.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shield"):
		queue_free()
