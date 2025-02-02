extends Node

@export var player_controller : CharacterBody2D
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
@onready var water_0: AudioStreamPlayer2D = $"../Water0"
@onready var water_1: AudioStreamPlayer2D = $"../Water1"
@onready var water_3: AudioStreamPlayer2D = $"../Water3"
@onready var water_sounds = [water_0, water_1, water_3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("WaterTree"):
		sprite.global_position = player_controller.global_position + Vector2(0, -8)
		sprite.visible = true
		animation_player.play("watering")
		var WaterSound_Toplay = water_sounds.pick_random()
		WaterSound_Toplay.play()

func _on_watering_can_animation_player_animation_finished(_anim_name: StringName) -> void:
	sprite.visible = false
