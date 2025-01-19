extends CharacterBody2D
class_name PlayerController

@export var speed =10
@export var jump_velocity = 10 
@export var RespawnPoint : Marker2D

var speed_multiplier = 30
var jump_multiplier = -30
var direction = 0


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	#go back to menu 
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
		
	#respawn 
	if Input.is_action_just_pressed("reset level"):
		global_position = RespawnPoint.position
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity * jump_multiplier

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * (speed * speed_multiplier)
	else:
		velocity.x = move_toward(velocity.x, 0, (speed * speed_multiplier))

	move_and_slide()
