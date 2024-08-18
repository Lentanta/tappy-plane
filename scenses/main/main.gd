extends Node2D

@export var pipes_scene: PackedScene

@onready var spawn_upper = $SpawnUpper
@onready var spawn_lowwer = $SpawnLower
@onready var spawn_timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_timer_timeout() -> void:
	spawn_pipes()


func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(
		spawn_upper.position.y,
		spawn_lowwer.position.y
	)
	
	# Set random y position to the pipes
	new_pipes.position = Vector2(spawn_upper.position .x, y_pos)
	add_child(new_pipes)
	
# Before when not using SignalManager
# We have to iterate all of this pipes to stop them
#func stop_pipes() -> void:
#	var pipes = get_tree().get_nodes_in_group("pipes")
#	for pipe in pipes:
#		pipe.set_process(false)


func _on_plane_died() -> void:
	#stop_pipes()
	spawn_timer.stop()
