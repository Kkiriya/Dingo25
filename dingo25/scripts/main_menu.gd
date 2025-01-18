extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level/test.tscn")


func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/option.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit() 
