extends Area2D

@export var speed = 400
@onready var shot = $"."
@onready var score_label = $score_coutn

func _process(delta: float) -> void:
	position -= transform.y * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		GlobalScore.score += 1
		body.queue_free()
		shot.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
