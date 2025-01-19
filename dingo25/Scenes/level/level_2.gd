extends Node
@export var player : CharacterBody2D
@export var next_level : Area2D
@export var respawn : Marker2D

var in_body = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if in_body == 1:
		if Input.is_action_just_pressed("up"):
			get_tree().change_scene_to_file("res://scenes/level/test.tscn")
func _on_next_level_body_entered(body: Node2D) -> void:
	in_body = 1
	#
	

func _on_next_level_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	in_body = 0


func _on_killzone_body_entered(body: Node2D) -> void:
	print("test1")
	player.global_position = respawn.global_position


func _on_killzone_1_body_entered(body: Node2D) -> void:
	player.global_position = respawn.global_position
	print("test1")


func _on_killzone_2_body_entered(body: Node2D) -> void:
	player.global_position = respawn.global_position
	print("test1")


func _on_killzone_3_body_entered(body: Node2D) -> void:
	player.global_position = respawn.global_position
	print("test1")
