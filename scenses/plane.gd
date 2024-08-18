extends CharacterBody2D

const GRAVITY: float = 1500.0
const POWER: float = 500.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	
	if is_on_floor():
		print("DEAD")
		die()
		

func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("FLY_UP"):
		velocity.y = -POWER
		animation_player.play("Power")
		
		
func die() -> void:
	SignalManager.on_plane_died.emit()
	animation_player.pause()
	animated_sprite_2d.stop()
	set_physics_process(false)

