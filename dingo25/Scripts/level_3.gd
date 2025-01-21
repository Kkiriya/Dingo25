extends Node
@export var player : CharacterBody2D
@export var next_level : Area2D

var in_body = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if in_body == 1:
		if Input.is_action_just_pressed("up"):
			get_tree().change_scene_to_file("res://scenes/level/level_1.tscn")
func _on_next_level_body_entered(_body: Node2D) -> void:
	in_body = 1
	

func _on_next_level_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	in_body = 0
