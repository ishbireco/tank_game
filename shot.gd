extends Area2D

@export var speed = 400
@onready var shot = $"."

func _process(delta: float) -> void:
	position -= transform.y * speed * delta
