extends Node

@export var player_controller : CharacterBody2D
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("WaterTree"):
		sprite.global_position = player_controller.global_position + Vector2(0, -8)
		sprite.visible = true
		animation_player.play("watering")
		


func _on_watering_can_animation_player_animation_finished(_anim_name: StringName) -> void:
	sprite.visible = false
