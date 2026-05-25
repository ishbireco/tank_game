extends Label

@onready var count = $"."

func _process(delta: float) -> void:
	count.text = "Score: " + str(GlobalScore.score)
