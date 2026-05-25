extends Node2D

var enemy_tank = preload("res://scenes/enemy_tank.tscn")
@onready var markers = get_tree().get_nodes_in_group("spawn_points")
@export var time_curve : Curve
var max_score = 100

func spawn_on_timer():
	var timer = Timer.new()
	add_child(timer)
	var ratio = float(GlobalScore.score)/max_score
	timer.wait_time = 2 * time_curve.sample(ratio)
	timer.one_shot = false
	timer.timeout.connect(spawn_on_random_marker)
	timer.start()

func spawn_on_random_marker():
	var enemy_inst = enemy_tank.instantiate()
	var rand_marker = markers.pick_random()
	
	enemy_inst.global_position = rand_marker.global_position
	add_child(enemy_inst)
	
func _ready():
	spawn_on_random_marker()
	spawn_on_timer()
