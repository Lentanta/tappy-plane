extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * GameManager.SCROLL_SPEED


func _on_screen_exited() -> void:
	pass


func on_plane_died() -> void:
	set_process(false)
	

func _on_laser_body_exited(body: Node2D) -> void:
	print("POINT +1")


func _on_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group(GameManager.GROUP_PLAYER):
		if body.has_method("die"):
			body.die()
