extends Area2D

@onready var sheild_sprite = $Sprite2D
@onready var collion_shape = $CollisionShape2D
@onready var shield = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sheild_sprite.hide()
	collion_shape.disabled = true
	shield.visible = false
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shield"):
		sheild_sprite.show()
		collion_shape.disabled = false
		shield.visible = true
	elif Input.is_action_just_released("shield"):
		sheild_sprite.hide()
		collion_shape.disabled = true
		shield.visible = false

func _physics_process(delta: float) -> void:
	shield.look_at(get_global_mouse_position())
	shield.rotation += 3.14/2
