extends Control

@export var player_controller : PlayerController
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


func _on_jump_text_submitted(new_text: String) -> void:
	var new_jump = float(new_text)
	if new_jump > 0:
		player_controller.jump_velocity = new_jump


func _on_speed_text_submitted(new_text: String) -> void:
	var new_speed = float(new_text)
	if new_speed > 0:
		player_controller.speed = new_speed
