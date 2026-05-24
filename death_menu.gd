extends Control

@onready var current_scene = preload("res://main.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	GlobalScore.score = 0
