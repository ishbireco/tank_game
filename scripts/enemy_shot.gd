extends Area2D

@export var speed = 200
@onready var tank = preload("res://scenes/tank.tscn")
@onready var shield = preload("res://scenes/shield.tscn")
@export var time_curve : Curve
var max_score = 100

func _process(delta: float) -> void:
	var ratio = float(GlobalScore.score)/max_score
	var new_speed = speed * time_curve.sample(ratio) * delta
	global_position -= transform.y * new_speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/death_menu.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shield"):
		queue_free()
