extends CharacterBody2D

@export var speed =10
@export var jump_velocity = 10 
@export var RespawnPoint : Marker2D
@export var jumpUI: Label
@export var waterUI: Label
@export var resetlvl_UI: Label
@export var nextlvl_UI: Label
@export var fall_sound : AudioStreamPlayer
@export var jump_sound : AudioStreamPlayer
#@export var NextLevel : Area2D

var speed_multiplier = 30
var jump_multiplier = -30
var direction = 0


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func _ready() -> void:
	jumpUI.visible = false
	waterUI.visible = false
	resetlvl_UI.visible = false
	nextlvl_UI.visible = false


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
		jump_sound.play()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * (speed * speed_multiplier)
	else:
		velocity.x = move_toward(velocity.x, 0, (speed * speed_multiplier))

	move_and_slide()


func _on_jump_body_entered(_body: Node2D) -> void:
	jumpUI.visible = true
	waterUI.visible = false
	resetlvl_UI.visible = false
	nextlvl_UI.visible = false
	await get_tree().create_timer(1).timeout
	jumpUI.visible = false


func _on_water_body_entered(_body: Node2D) -> void:
	waterUI.visible = true
	jumpUI.visible = false
	resetlvl_UI.visible = false
	nextlvl_UI.visible = false
	await get_tree().create_timer(1).timeout
	waterUI.visible = false


func _on_next_level_body_entered(_body: Node2D) -> void:
	nextlvl_UI.visible = true
	jumpUI.visible = false
	waterUI.visible = false
	resetlvl_UI.visible = false
	await get_tree().create_timer(1).timeout
	nextlvl_UI.visible = false


func _on_reset_body_entered(_body: Node2D) -> void:
	resetlvl_UI.visible = true
	jumpUI.visible = false
	waterUI.visible = false
	nextlvl_UI.visible = false
	await get_tree().create_timer(1).timeout
	resetlvl_UI.visible = false
