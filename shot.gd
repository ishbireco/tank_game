extends Area2D

@export var speed = 400
@onready var shot = $"."

func _process(delta: float) -> void:
	position -= transform.y * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
		shot.queue_free()
