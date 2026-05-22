extends Area2D

@export var speed = 100
@onready var shot = $"."

func _process(delta):
    shot.position += Vector2.from_angle(rotation - deg_to_rad(90)) * speed * delta